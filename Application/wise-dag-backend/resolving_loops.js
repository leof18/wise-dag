const neo4j = require('neo4j-driver');
const { exec } = require('child_process');

(async () => {
  const URI = "neo4j+s://2801843c.databases.neo4j.io"; // Replace with your Neo4j URI
  const USER = "neo4j"; // Replace with your Neo4j username
  const PASSWORD = "e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk"; // Replace with your Neo4j password

  let driver;

  try {
    // Initialize the driver
    driver = neo4j.driver(URI, neo4j.auth.basic(USER, PASSWORD));
    const serverInfo = await driver.getServerInfo();
    console.log('Connection established.');
    console.log(serverInfo);

    // Create a session
    const session = driver.session();

    // Define parameters
    const parameters = {
      selectedIteration: { id: 0 },
      selectedNodes: { name: ["Substance","Biological substance"] },
      exposure: { name: "Clinical finding"},
      outcome: { name: "Death"}
    };

    // Define your Cypher query
    const query = `
        // Get nodes, excluding expanded nodes
        MATCH (iteration:Iteration {id: $selectedIteration.id})
        MATCH (concept:Concept)-[:PART_OF]->(iteration)
        WHERE NOT concept.name IN $selectedNodes.name
        MATCH (exposure:Concept {name: $exposure.name})
        MATCH (outcome:Concept {name: $outcome.name})
        
        // Get children of expanded nodes
        OPTIONAL MATCH (expanded:Concept)-[:SUBSUMES]->(child:Concept) 
        WHERE expanded.name IN $selectedNodes.name

        // Collect all nodes
        WITH COLLECT(concept) + COLLECT(DISTINCT child) AS initialNodes, exposure, outcome

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

        // Match only relationships that exist between these Nodes
        UNWIND Nodes AS Node
        OPTIONAL MATCH (Node)-[causal:CAUSES]->(otherNode)
        WHERE otherNode IN Nodes

        RETURN 
            COLLECT(DISTINCT Node) AS resultingNodes,
            COLLECT(DISTINCT causal) AS causalRelationships,

            // For Dagitty
            COLLECT(DISTINCT Node.name) AS allNodes,
            COLLECT(DISTINCT { from: Node.name, to: otherNode.name }) AS causalEdges;
    `;

    // Run the query
    const result = await session.run(query, parameters);
    console.log('Query executed successfully.');

    // Convert to Dagitty
    const allNodes = result.records[0].get("allNodes");
    const causalEdges = result.records[0].get("causalEdges");
    const exposureNode = parameters.exposure.name;
    const outcomeNode = parameters.outcome.name;

    const timePoints = 3
    const timeOrderedNodes = {
        "Clinical finding": 1,
        "Death": 2,
        "Biological substance": 1.5
    };

    // Start building the Dagitty graph string.
    let dagittyGraph = "dag {\n";

    // ─── 1. Create nodes for each timestep ────────────────────────────────
    // For each timestep t from 1 to timePoints, create a copy of every node.
    for (let t = 1; t <= timePoints; t++) {
        allNodes.forEach(node => {
            // For t = 1, keep the original name; for t > 1, add the suffix.
            const nodeName = t === 1 ? node : `${node}_${t}`;
            let attributes = [];
            if (node === exposureNode) attributes.push("exposure");
            if (node === outcomeNode) attributes.push("outcome");
            if (timeOrderedNodes[node] !== undefined) attributes.push(`time=${timeOrderedNodes[node]}`);
            if (attributes.length > 0) {
                dagittyGraph += `  "${nodeName}" [${attributes.join(", ")}];\n`;
            } else {
                dagittyGraph += `  "${nodeName}";\n`;
            }
        });
    }

    // ─── 2. Intra–timestep causal edges ────────────────────────────────────
    // For every timestep, add the same causal edges as defined originally.
    for (let t = 1; t <= timePoints; t++) {
        causalEdges.forEach(edge => {
            if (edge.from && edge.to) {
                const source = t === 1 ? edge.from : `${edge.from}_${t}`;
                const target = t === 1 ? edge.to : `${edge.to}_${t}`;
                dagittyGraph += `  "${source}" -> "${target}";\n`;
            } 
        });
    }

    // ─── 3. Cross–timestep edges ───────────────────────────────────────────
    // For every pair of timesteps (i, j) with i < j, add:
    //    a) Self–progression edges (each node "progresses" from timestep i to j)
    //    b) Cross–timestep causal edges (if A -> B originally, then A_i -> B_j)
    for (let i = 1; i < timePoints; i++) {
        for (let j = i + 1; j <= timePoints; j++) {
            // a) Self–progression for each node.
            allNodes.forEach(node => {
                const source = i === 1 ? node : `${node}_${i}`;
                const target = `${node}_${j}`; // for j > 1, always add the suffix.
                dagittyGraph += `  "${source}" -> "${target}";\n`;
            });
            // b) Cross–timestep causal edges.
            causalEdges.forEach(edge => {
                if (edge.from && edge.to) { 
                    const source = i === 1 ? edge.from : `${edge.from}_${i}`;
                    const target = `${edge.to}_${j}`;
                    dagittyGraph += `  "${source}" -> "${target}";\n`;
                }
            });
        }
    }

    dagittyGraph += "}\n";

    // Close the session
    await session.close();

    // Call R script to process the DAG and resolve loops
    checkLoopsWithDagitty(dagittyGraph);

  } catch (err) {
    console.error(`Connection or query error:\n${err}`);
  } finally {
    // Close the driver
    if (driver) {
      await driver.close();
    }
  }
})();

// Function to send DAG data to R and process it
const R_SCRIPT_PATH = '"C:\\Program Files\\R\\R-4.3.1\\bin\\Rscript.exe"';
const check_loops_command = `${R_SCRIPT_PATH} check_dag_loops.R dagitty_input.txt`;

function checkLoopsWithDagitty(dagData) {
    const fs = require('fs');

    fs.writeFileSync("dagitty_input.txt", dagData, { encoding: "utf8"});

    exec(check_loops_command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error running R script: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`R Script Error: ${stderr}`);
            return;
        }
        console.log("R Output:\n", stdout);
    });
}