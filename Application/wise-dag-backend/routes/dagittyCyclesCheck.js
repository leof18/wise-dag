// api/dagitty.js
const express = require('express');
const router = express.Router();
const { driver } = require("../db/neo4j");

const { exec } = require('child_process');
const fs = require('fs');

// Path to your R executable and command to call your R script.
const R_SCRIPT_PATH = '"C:\\Program Files\\R\\R-4.3.1\\bin\\Rscript.exe"';
const CHECK_LOOPS_COMMAND = `${R_SCRIPT_PATH} check_dag_loops.R dagitty_input.txt`;

// Define a cache variable to hold the graph data
let cachedGraphData = null;

/**
 * A helper function that runs the database query and returns the data.
 * If the data is already cached, it returns that instead.
 */
async function getGraphData(parameters) {
  // If we already have cached data, return it immediately.
  if (cachedGraphData) {
    console.log("Using cached graph data.");
    return cachedGraphData;
  }
  
  console.log("Fetching data from the database...");
  const session = driver.session();
  try {
    const query = `
      // Get nodes, excluding expanded nodes
      MATCH (iteration:Iteration {id: $selectedIteration})
      MATCH (concept:Concept)-[:PART_OF]->(iteration)
      WHERE NOT concept.name IN $selectedNodes
      MATCH (exposure:Concept {name: $exposure})
      MATCH (outcome:Concept {name: $outcome})
      
      // Get children of expanded nodes
      OPTIONAL MATCH (expanded:Concept)-[:SUBSUMES]->(child:Concept) 
      WHERE expanded.name IN $selectedNodes AND NOT child.name IN $selectedNodes

      // Collect all nodes
      WITH COLLECT(DISTINCT concept) + COLLECT(DISTINCT child) AS initialNodes, exposure, outcome

      // Ensure exposure and outcome are only added if they are not already in concepts or children
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

    // Cache the result in memory
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

    // Get the graph data, using the cache if available.
    const { allNodes, causalEdges } = await getGraphData(parameters);

    // Build the Dagitty graph string.
    let dagittyGraph = "dag {\n";

    // 1. Create nodes for each timestep.
    for (let t = 1; t <= timepoints; t++) {
      allNodes.forEach(node => {
        const nodeName = `${node}_T${t}`;
        let attributes = [];
        if (node === exposure) attributes.push("exposure");
        if (node === outcome) attributes.push("outcome");
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

    // Write the generated DAG to a file that the R script will process.
    fs.writeFileSync("dagitty_input.txt", dagittyGraph, { encoding: "utf8" });

    // Call the R script to process the DAG and resolve loops.
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
        // Process the R script output.
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
