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
  const { granularity, selectedNodes, exposure, outcome, timepoints, nodeOrder } = req.body;

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

    let dagittyGraph = "dag {\n";

    for (let t = 1; t <= timepoints; t++) {
      allNodes.forEach(node => {
        const nodeName = `${node}_T${t}`;
        let attributes = [];
        // Only set "exposure" at the first timepoint
        if (t === 1 && node === exposure.value) {
          attributes.push("exposure");
        }
        // Only set "outcome" at the last timepoint
        if (t === timepoints && node === outcome.value) {
          attributes.push("outcome");
        }
        // Push time attribute
        if (nodeOrder[node] !== undefined) {
          attributes.push(`time=${nodeOrder[node]}`);
        }

        if (attributes.length > 0) {
          dagittyGraph += `  "${nodeName}" [${attributes.join(", ")}];\n`;
        } else {
          dagittyGraph += `  "${nodeName}";\n`;
        }
      });
    }
    // 2. Intra–timestep causal edges.
    for (let t = 1; t <= timepoints; t++) {
      causalEdges.forEach(edge => {
        if (edge.from && edge.to) {
          if (
            nodeOrder[edge.from] !== undefined &&
            nodeOrder[edge.to] !== undefined
          ) {
            if (nodeOrder[edge.from] <= nodeOrder[edge.to]) {
              const source = `${edge.from}_T${t}`;
              const target = `${edge.to}_T${t}`;
              dagittyGraph += `  "${source}" -> "${target}";\n`;
            }
          } else {
              const source = `${edge.from}_T${t}`;
              const target = `${edge.to}_T${t}`;
              dagittyGraph += `  "${source}" -> "${target}";\n`;
          }
        }
      });
    }

    // 3. Cross–timestep edges.
    for (let i = 1; i < timepoints; i++) {
      for (let j = i + 1; j <= timepoints; j++) {
        // a) Self–progression edges.
        allNodes.forEach(node => {
          const source = `${node}_T${i}`;
          const target = `${node}_T${j}`;
          dagittyGraph += `  "${source}" -> "${target}";\n`;
        });
        // b) Cross–timestep causal edges.
        causalEdges.forEach(edge => {
          if (edge.from && edge.to) {
            const source = `${edge.from}_T${i}`;
            const target = `${edge.to}_T${j}`;
            dagittyGraph += `  "${source}" -> "${target}";\n`;
          }
        });
      }
    }


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
