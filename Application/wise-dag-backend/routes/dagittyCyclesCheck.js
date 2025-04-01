const express = require('express');
const router = express.Router();
const { driver } = require("../db/neo4j");
const { exec } = require('child_process');
const fs = require('fs');
const os = require('os');

// Determine the OS and set the R script path accordingly
const getRScriptPath = () => {
  const platform = os.platform();
  if (platform === 'win32') {
    return '"C:\\Program Files\\R\\R-4.3.1\\bin\\Rscript.exe"';
  } else if (platform === 'darwin') {
    return '/usr/local/bin/Rscript'; // macOS default R path
  } else if (platform === 'linux') {
    return '/usr/local/bin/Rscript'; // Linux default R path
  } else {
    throw new Error('Unsupported OS for R script execution.');
  }
};

// Dynamically construct the command to run the R script
const CHECK_LOOPS_COMMAND = `${getRScriptPath()} check_dag_loops.R dagitty_input.txt`;

// Define a cache variable to hold the graph data 
let cachedGraphData = null;

async function getGraphData(parameters) {
  if (cachedGraphData) {
    console.log("Using cached graph data.");
    return cachedGraphData;
  }

  console.log("Fetching data from the database...");
  const session = driver.session();
  try {
    const query = `
      MATCH (iteration:Iteration {id: $selectedIteration})
      MATCH (concept:Concept)-[:PART_OF]->(iteration)
      WHERE NOT concept.name IN $selectedNodes
      OPTIONAL MATCH (expanded:Concept)-[:SUBSUMES]->(child:Concept) 
      WHERE expanded.name IN $selectedNodes AND NOT child.name IN $selectedNodes
      WITH COLLECT(DISTINCT concept) + COLLECT(DISTINCT child) AS Nodes
      UNWIND Nodes AS Node
      WITH COLLECT(DISTINCT Node) as Nodes
      UNWIND Nodes as Node
      WITH Node
          WHERE Node.name IN $chosenNodes
      WITH COLLECT(Node) as Nodes
      UNWIND Nodes as Node
      OPTIONAL MATCH (Node)-[causal:CAUSES]->(otherNode)
      WHERE otherNode IN Nodes
      WITH COLLECT(DISTINCT Node.name) AS allNodes,
           COLLECT(DISTINCT CASE WHEN otherNode IS NOT NULL 
                            THEN { from: Node.name, to: otherNode.name } 
                      END) AS rawEdges
      RETURN 
          allNodes,
          [edge IN rawEdges WHERE edge IS NOT NULL] AS causalEdges;
    `;
    const result = await session.run(query, parameters);
    const allNodes = result.records[0].get("allNodes");
    const causalEdges = result.records[0].get("causalEdges");

    cachedGraphData = { allNodes, causalEdges};
    return cachedGraphData;
  } finally {
    await session.close();
  }
}

/**
 * Compute a topological order for a list of nodes (base names) given a set of edges.
 * Each edge is an object { from, to } (both base names).
 */
function computeNodeOrder(nodes, edges) {
  let inDegree = {};
  nodes.forEach(n => { inDegree[n] = 0; });
  edges.forEach(e => {
    if (inDegree.hasOwnProperty(e.to)) {
      inDegree[e.to]++;
    }
  });
  let queue = nodes.filter(n => inDegree[n] === 0);
  let order = {};
  let currentOrder = 0;
  while (queue.length > 0) {
    let n = queue.shift();
    order[n] = currentOrder++;
    edges.forEach(e => {
      if (e.from === n) {
        inDegree[e.to]--;
        if (inDegree[e.to] === 0) {
          queue.push(e.to);
        }
      }
    });
  }
  // For any nodes that weren't reached (due to cycles), assign order arbitrarily.
  nodes.forEach(n => {
    if (order[n] === undefined) {
      order[n] = currentOrder++;
    }
  });
  return order;
}

/**
 * After cycles are resolved, read dagitty_input.txt, parse nodes and edges,
 * compute ordering based on the (acyclic) edges, update positions, and write back the file.
 *
 * The algorithm:
 * 1. For each node definition, remove the timepoint suffix (if any) to get its base name.
 * 2. Build base edges (also stripping _T suffix) from the edge definitions.
 * 3. Compute a topological order for the base nodes.
 * 4. For fixed nodes (which do not have _T suffix), assign x = 0.
 * 5. For non-fixed nodes, group by timepoint and then assign x = (timepoint-1 + normalizedOrder) * scaleFactor,
 *    and y based on the sorted order within that timepoint.
 */
function updateDagittyPositions(filePath, scaleFactor = 1) {
  let fileContent = fs.readFileSync(filePath, 'utf8');
  const lines = fileContent.split('\n');
  let insideDag = false;
  let nodeDefs = {};  // { label: attributeString }
  let edgeDefs = [];  // array of { from, to }

  lines.forEach(line => {
    line = line.trim();
    if (line.startsWith('dag {')) { insideDag = true; return; }
    if (line.startsWith('}')) { insideDag = false; return; }
    if (insideDag) {
      if (line.includes('->')) {
        // Edge definition, e.g. "A_T1" -> "B_T1";
        const edgeMatch = line.match(/"([^"]+)"\s*->\s*"([^"]+)"/);
        if (edgeMatch) {
          edgeDefs.push({ from: edgeMatch[1], to: edgeMatch[2] });
        }
      } else if (line.includes('[')) {
        // Node definition, e.g. "A_T1" [attr1, attr2];
        const nodeMatch = line.match(/^"([^"]+)"\s*\[(.+)\];$/);
        if (nodeMatch) {
          const label = nodeMatch[1];
          const attrStr = nodeMatch[2];
          nodeDefs[label] = attrStr;
        }
      }
    }
  });

  // Build set of base nodes (remove any _T suffix from non-fixed nodes)
  const baseNodesSet = new Set();
  Object.keys(nodeDefs).forEach(label => {
    const base = label.replace(/_T\d+$/, '');
    baseNodesSet.add(base);
  });
  const baseNodes = Array.from(baseNodesSet);

  // Build base edges by stripping any timepoint suffix.
  let baseEdges = [];
  edgeDefs.forEach(e => {
    const fromBase = e.from.replace(/_T\d+$/, '');
    const toBase = e.to.replace(/_T\d+$/, '');
    if (fromBase !== toBase) {
      baseEdges.push({ from: fromBase, to: toBase });
    }
  });

  // Compute topological order based on base nodes and baseEdges.
  const computedOrder = computeNodeOrder(baseNodes, baseEdges);

  // Prepare updated node definitions.
  let updatedNodeLines = [];
  // Fixed nodes: we assume these do not have a _T suffix.
  const fixedLabels = Object.keys(nodeDefs).filter(label => !label.match(/_T\d+$/));
  fixedLabels.sort();
  fixedLabels.forEach((label, index) => {
    const y = ((index + 1) / (fixedLabels.length + 1)) + (Math.random() - 0.5) * 0.05;
    const x = 0;
    const newPos = `pos="${(x * scaleFactor).toFixed(3)},${y.toFixed(3)}"`;
    let attrStr = nodeDefs[label];
    if (attrStr.match(/pos="[^"]*"/)) {
      attrStr = attrStr.replace(/pos="[^"]*"/, newPos);
    } else {
      attrStr += `, ${newPos}`;
    }
    updatedNodeLines.push(`  "${label}" [${attrStr}];`);
  });

  // Non-fixed nodes: those with _T suffix. Group them by timepoint.
  const nonFixedLabels = Object.keys(nodeDefs).filter(label => label.match(/_T\d+$/));
  let groups = {}; // key: timepoint, value: array of labels
  nonFixedLabels.forEach(label => {
    const tMatch = label.match(/_T(\d+)$/);
    const t = tMatch ? parseInt(tMatch[1], 10) : 1;
    if (!groups[t]) groups[t] = [];
    groups[t].push(label);
  });

  // For each timepoint group, sort by computed order (using base node order)
  Object.keys(groups).forEach(tStr => {
    groups[tStr].sort((a, b) => {
      const baseA = a.replace(/_T\d+$/, '');
      const baseB = b.replace(/_T\d+$/, '');
      return computedOrder[baseA] - computedOrder[baseB];
    });
  });

  // Now update positions for non-fixed nodes.
  Object.keys(groups).forEach(tStr => {
    const t = parseInt(tStr, 10);
    const group = groups[t];
    // For normalization, get computed orders for this group.
    const orders = group.map(label => computedOrder[label.replace(/_T\d+$/, '')]);
    const minOrder = Math.min(...orders);
    const maxOrder = Math.max(...orders);
    group.forEach((label, index, arr) => {
      const base = label.replace(/_T\d+$/, '');
      const orderVal = computedOrder[base];
      let normalized = 0.5;
      if (maxOrder > minOrder) {
        normalized = (orderVal - minOrder) / (maxOrder - minOrder);
      }
      // x: (t + normalizedOrder)*scaleFactor; y: vertical spacing within the group.
      const x = (t + normalized) * scaleFactor;
      const y = ((index + 1) / (arr.length + 1)) + (Math.random() - 0.5) * 0.05;
      const newPos = `pos="${x.toFixed(3)},${y.toFixed(3)}"`;
      let attrStr = nodeDefs[label];
      if (attrStr.match(/pos="[^"]*"/)) {
        attrStr = attrStr.replace(/pos="[^"]*"/, newPos);
      } else {
        attrStr += `, ${newPos}`;
      }
      updatedNodeLines.push(`  "${label}" [${attrStr}];`);
    });
  });

  // Rebuild edge definitions.
  let edgeLines = [];
  edgeDefs.forEach(e => {
    edgeLines.push(`  "${e.from}" -> "${e.to}";`);
  });

  const newContent = "dag {\n" + updatedNodeLines.join("\n") + "\n" + edgeLines.join("\n") + "\n}";
  fs.writeFileSync(filePath, newContent, 'utf8');
  console.log("Updated positions in", filePath);
}

// Main route handler.
router.post('/cycles', async (req, res) => {
  const { granularity, selectedNodes, chosenNodes, exposure, outcome, timepoints, nodeOrder, nodeSettings, resetCache } = req.body;

  // Reset the cache if the flag is set.
  if (resetCache) {
    cachedGraphData = null;
    console.log("Cache has been reset due to resetCache flag.");
  }

  try {
    const parameters = {
      selectedIteration: granularity,
      selectedNodes: selectedNodes,
      chosenNodes: chosenNodes
    };

    const { allNodes, causalEdges } = await getGraphData(parameters);

    // Add custom exposure and outcome if needed.
    if (exposure.type === "custom" && !allNodes.includes(exposure.value)) {
      allNodes.push(exposure.value);
    }
    if (outcome.type === "custom" && !allNodes.includes(outcome.value)) {
      allNodes.push(outcome.value);
    }

    const scaleFactor = 1; // adjust if needed
    let dagittyGraph = "dag {\n";

    // Process fixed nodes (output once, without suffix)
    const fixedNodes = allNodes.filter(node => nodeSettings[node] && nodeSettings[node].isFixed);
    fixedNodes.forEach((node, index) => {
      const y = ((index + 1) / (fixedNodes.length + 1)) + (Math.random() - 0.5) * 0.05;
      const x = 0; // fixed nodes are on the very left
      const pos = `pos="${(x * scaleFactor).toFixed(3)},${y.toFixed(3)}"`;
      let attributes = [];
      if (node === exposure.value) attributes.push("exposure");
      if (node === outcome.value) attributes.push("outcome");
      const observationAttr = nodeSettings[node].observation && nodeSettings[node].observation.trim() !== ""
        ? nodeSettings[node].observation.trim()
        : "";
      if (observationAttr !== "") attributes.push(observationAttr);
      attributes.push(pos);
      dagittyGraph += attributes.length > 0
        ? `  "${node}" [${attributes.join(", ")}];\n`
        : `  "${node}";\n`;
    });

    // Process non-fixed nodes (will initially get a default pos based on timepoint)
    const nonFixedNodes = allNodes.filter(node => !(nodeSettings[node] && nodeSettings[node].isFixed));
    for (let t = 1; t <= timepoints; t++) {
      nonFixedNodes.forEach((node, index, arr) => {
        const x = (t) * scaleFactor;
        const y = 1;
        const pos = `pos="${x.toFixed(3)},${y.toFixed(3)}"`;
        const nodeName = `${node}_T${t}`;
        let attributes = [];
        attributes.push(pos);
        if (t === 1 && node === exposure.value) attributes.push("exposure");
        if (t === timepoints && node === outcome.value) attributes.push("outcome");
        const observationAttr = nodeSettings[node].observation && nodeSettings[node].observation.trim() !== ""
          ? nodeSettings[node].observation.trim()
          : "";
        if (observationAttr !== "") attributes.push(observationAttr);
        dagittyGraph += `  "${nodeName}" [${attributes.join(", ")}];\n`;
      });
    }

    // Helper: Get node label (fixed nodes remain the same; non-fixed get _T suffix)
    function getNodeLabel(node, t) {
      const settings = nodeSettings && nodeSettings[node];
      const isFixed = settings && settings.isFixed;
      return isFixed ? node : `${node}_T${t}`;
    }

    // Build EDGES.
    const allEdges = new Set();
    // Intra–timestep causal edges.
    for (let t = 1; t <= timepoints; t++) {
      causalEdges.forEach(edge => {
        if (edge.from && edge.to) {
          // If the target node is fixed, skip adding the arrow since no node should be abe to affect the node that is fixed in time within the timeframe.
          if (nodeSettings[edge.to] && nodeSettings[edge.to].isFixed) return;

          const sourceLabel = getNodeLabel(edge.from, t);
          const targetLabel = getNodeLabel(edge.to, t);
          const fromFixed = nodeSettings && nodeSettings[edge.from] && nodeSettings[edge.from].isFixed;
          const toFixed = nodeSettings && nodeSettings[edge.to] && nodeSettings[edge.to].isFixed;
          if (!fromFixed && !toFixed && nodeOrder[edge.from] !== undefined && nodeOrder[edge.to] !== undefined) {
            if (nodeOrder[edge.from] <= nodeOrder[edge.to]) {
              const edgeString = `"${sourceLabel}" -> "${targetLabel}"`;
              allEdges.add(edgeString);
            }
          } else {
            const edgeString = `"${sourceLabel}" -> "${targetLabel}"`;
            allEdges.add(edgeString);
          }
        }
      });
    }
    // Cross–timestep edges.
    for (let i = 1; i < timepoints; i++) {
      for (let j = i + 1; j <= timepoints; j++) {
        // Self–progression for non-fixed nodes.
        allNodes.forEach(node => {
          const settings = nodeSettings && nodeSettings[node];
          const isFixed = settings && settings.isFixed;
          if (!isFixed) {
            const source = `${node}_T${i}`;
            const target = `${node}_T${j}`;
            const edgeString = `"${source}" -> "${target}"`;
            allEdges.add(edgeString);
          }
        });
        // Cross–timestep causal edges.
        causalEdges.forEach(edge => {
          // Skip edges if the target node is fixed.
          if (nodeSettings[edge.to] && nodeSettings[edge.to].isFixed) return;
          const source = getNodeLabel(edge.from, i);
          const target = getNodeLabel(edge.to, j);
          const edgeString = `"${source}" -> "${target}"`;
          allEdges.add(edgeString);
        });
      }
    }
    allEdges.forEach(edgeStr => {
      dagittyGraph += `  ${edgeStr};\n`;
    });
    dagittyGraph += "}\n";
    fs.writeFileSync("dagitty_input.txt", dagittyGraph, { encoding: "utf8" });

    // Run the R script to check for cycles.
    exec(CHECK_LOOPS_COMMAND, { maxBuffer: 1024 * 1024, timeout: 30000 }, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error running R script: ${error.message}`);
        return res.status(500).json({ error: error.message });
      }
      if (stderr) {
        console.error(`R Script Error: ${stderr}`);
      }
      console.log(stdout);
      console.log("Updating positions...")
      updateDagittyPositions("dagitty_input.txt", scaleFactor);
      if (stdout.trim() === "No more cycles!") {
        
        return res.json({ rOutput: "No more cycles!" });
      } else {
        const regex = /(.+?)_T\d+(?=\s|$)/g;
        const matches = [...stdout.matchAll(regex)];
        const names = matches.map(match => match[1].trim());
        const processedOutput = names.join(" -> ");
        console.log(processedOutput);
        return res.json({ rOutput: processedOutput });
      }
    });
  } catch (err) {
    console.error(`Connection or query error:\n${err}`);
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
