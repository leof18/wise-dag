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
      MATCH (exposure:Concept {name: $exposure})
      MATCH (outcome:Concept {name: $outcome})
      OPTIONAL MATCH (expanded:Concept)-[:SUBSUMES]->(child:Concept) 
      WHERE expanded.name IN $selectedNodes AND NOT child.name IN $selectedNodes
      WITH COLLECT(DISTINCT concept) + COLLECT(DISTINCT child) AS initialNodes, exposure, outcome
      WITH CASE 
              WHEN exposure IN initialNodes THEN initialNodes 
              ELSE initialNodes + [exposure]
          END AS nodesWithExposure,
          outcome
      WITH CASE 
              WHEN outcome IN nodesWithExposure THEN nodesWithExposure 
              ELSE nodesWithExposure + [outcome] 
          END AS Nodes
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
      selectedNodes: selectedNodes,
      exposure: exposure,
      outcome: outcome
    };

    const { allNodes, causalEdges } = await getGraphData(parameters);
    let dagittyGraph = "dag {\n";

    for (let t = 1; t <= timepoints; t++) {
      allNodes.forEach(node => {
        const nodeName = `${node}_T${t}`;
        let attributes = [];
        if (node === exposure) attributes.push("exposure");
        if (node === outcome) attributes.push("outcome");
        if (nodeOrder[node] !== undefined) {
          attributes.push(`time=${nodeOrder[node]}`);
        }
        dagittyGraph += `  "${nodeName}" [${attributes.join(", ")}];\n`;
      });
    }

    for (let t = 1; t <= timepoints; t++) {
      causalEdges.forEach(edge => {
        if (edge.from && edge.to) {
          dagittyGraph += `  "${edge.from}_T${t}" -> "${edge.to}_T${t}";\n`;
        }
      });
    }

    for (let i = 1; i < timepoints; i++) {
      for (let j = i + 1; j <= timepoints; j++) {
        allNodes.forEach(node => {
          dagittyGraph += `  "${node}_T${i}" -> "${node}_T${j}";\n`;
        });
        causalEdges.forEach(edge => {
          dagittyGraph += `  "${edge.from}_T${i}" -> "${edge.to}_T${j}";\n`;
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
