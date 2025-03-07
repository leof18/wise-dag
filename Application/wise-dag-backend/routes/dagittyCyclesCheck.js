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
    return '/usr/bin/Rscript'; // Linux default R path
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

    cachedGraphData = { allNodes, causalEdges };
    return cachedGraphData;
  } finally {
    await session.close();
  }
}

router.post('/cycles', async (req, res) => {
  console.log("Received payload:", req.body);
  const { granularity, selectedNodes, exposure, outcome, timepoints, nodeOrder, nodeSettings, resetCache} = req.body;

  // Reset the cache if the flag is set.
  if (resetCache) {
    cachedGraphData = null;
    console.log("Cache has been reset due to resetCache flag.");
  }

  try {
    const parameters = {
      selectedIteration: granularity,
      selectedNodes: selectedNodes
    };

    const { allNodes, causalEdges } = await getGraphData(parameters);

    // Add custom exposure and outcome
    if (exposure.type === "custom" && !allNodes.includes(exposure.value)) {
      allNodes.push(exposure.value);
    }
    if (outcome.type === "custom" && !allNodes.includes(outcome.value)) {
      allNodes.push(outcome.value);
    }

    const scaleFactor = 1; // adjust if needed

    let dagittyGraph = "dag {\n";

    // First, process the fixed nodes (they are output only once)
    const fixedNodes = allNodes.filter(node => nodeSettings[node] && nodeSettings[node].isFixed);
    fixedNodes.forEach((node, index) => {
      // Evenly space fixed nodes in y, plus a little random jitter
      const y = ((index + 1) / (fixedNodes.length + 1)) + (Math.random() - 0.5) * 0.05;
      const x = 0; // fixed nodes are on the very left
      const pos = `pos="${(x * scaleFactor).toFixed(3)},${y.toFixed(3)}"`;

      let attributes = [];
      // If the fixed node is the exposure or outcome, add the attributes.
      if (node === exposure.value) attributes.push("exposure");
      if (node === outcome.value) attributes.push("outcome");

      // Check if there is an observation attribute
      const observationAttr =
        nodeSettings[node].observation && nodeSettings[node].observation.trim() !== ""
          ? nodeSettings[node].observation.trim()
          : "";
      if (observationAttr !== "") attributes.push(observationAttr);

      // Always include the pos attribute.
      attributes.push(pos);

      dagittyGraph += attributes.length > 0
        ? `  "${node}" [${attributes.join(", ")}];\n`
        : `  "${node}";\n`;
    });

    // For non-fixed nodes, we want to normalize their order value first.
    // Get all non-fixed nodes that have an order defined.
    const nonFixedNodes = allNodes.filter(node => !(nodeSettings[node] && nodeSettings[node].isFixed));

    // For each timepoint, output a node instance for each non-fixed node.
    for (let t = 1; t <= timepoints; t++) {
      // For vertical spacing per timepoint, we group the nodes (here, simply the whole non-fixed list)
      nonFixedNodes.forEach((node, index, arr) => {

        // x position dependent on timepoint
        const x = (t) * scaleFactor;
        const y = 1
        const pos = `pos="${x.toFixed(3)},${y.toFixed(3)}"`;

        // Name the node with its time suffix.
        const nodeName = `${node}_T${t}`;

        let attributes = [];
        // Always include the computed position.
        attributes.push(pos);

        // Add exposure/outcome attributes only at the appropriate timepoint.
        if (t === 1 && node === exposure.value) attributes.push("exposure");
        if (t === timepoints && node === outcome.value) attributes.push("outcome");

        // Optionally add the original order as an attribute.
        if (nodeOrder[node] !== undefined) attributes.push(`order=${nodeOrder[node]}`);

        // Add any observation attribute.
        const observationAttr =
          nodeSettings[node].observation && nodeSettings[node].observation.trim() !== ""
            ? nodeSettings[node].observation.trim()
            : "";
        if (observationAttr !== "") attributes.push(observationAttr);

        dagittyGraph += `  "${nodeName}" [${attributes.join(", ")}];\n`;
      });
    }

    // Helper function to get the appropriate node label based on fixed status.
    function getNodeLabel(node, t) {
      const settings = nodeSettings && nodeSettings[node];
      const isFixed = settings && settings.isFixed;
      return isFixed ? node : `${node}_T${t}`;
    }

    // EDGES
    const allEdges = new Set();
    // 2. Intra–timestep causal edges
    for (let t = 1; t <= timepoints; t++) {
      causalEdges.forEach(edge => {
        if (edge.from && edge.to) {
          const sourceLabel = getNodeLabel(edge.from, t);
          const targetLabel = getNodeLabel(edge.to, t);
          // If both nodes are non-fixed, you can enforce the ordering (if desired)
          const fromFixed = nodeSettings && nodeSettings[edge.from] && nodeSettings[edge.from].isFixed;
          const toFixed = nodeSettings && nodeSettings[edge.to] && nodeSettings[edge.to].isFixed;
          if (!fromFixed && !toFixed && nodeOrder[edge.from] !== undefined && nodeOrder[edge.to] !== undefined) {
            if (nodeOrder[edge.from] <= nodeOrder[edge.to]) {
              const edgeString = `"${sourceLabel}" -> "${targetLabel}"`;
              allEdges.add(edgeString);
            }
          } else {
            // If one (or both) are fixed, simply add the edge.
            const edgeString = `"${sourceLabel}" -> "${targetLabel}"`;
            allEdges.add(edgeString);
          }
        }
      });
    }

// 3. Cross–timestep edges
    for (let i = 1; i < timepoints; i++) {
      for (let j = i + 1; j <= timepoints; j++) {
        // a) Self–progression edges for non-fixed nodes only.
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
        // b) Cross–timestep causal edges.
        causalEdges.forEach(edge => {
          const source = getNodeLabel(edge.from, i);
          const target = getNodeLabel(edge.to, j);
          // Build the edge string.
          const edgeString = `"${source}" -> "${target}"`;
          allEdges.add(edgeString);
        });
      }
    }
    // Append unique cross–timestep edges.
    allEdges.forEach(edgeStr => {
      dagittyGraph += `  ${edgeStr};\n`;
    });

    dagittyGraph += "}\n";
    fs.writeFileSync("dagitty_input.txt", dagittyGraph, { encoding: "utf8" });

    exec(CHECK_LOOPS_COMMAND, (error, stdout, stderr) => {
      if (error) {
        console.error(`Error running R script: ${error.message}`);
        return res.status(500).json({ error: error.message });
      }
      if (stderr) {
        console.error(`R Script Error: ${stderr}`);
      }
      console.log(stdout);
      if (stdout === "No more cycles!") {
        return res.json({ rOutput: stdout });
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
