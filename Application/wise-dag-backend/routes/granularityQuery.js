const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

router.post("/granularity-query", async (req, res) => {
  const { selectedIteration, selectedNodes , exposure, outcome } = req.body;

  // Validate required parameters
  if (!selectedIteration || !selectedNodes) {
    return res.status(400).json({
      error: "Missing required parameters: selectedIteration, selectedNodes",
    });
  }

  const session = driver.session();

  try {

    const params = {
      selectedIteration,
      selectedNodes,
      exposure,
      outcome
    };

    const query = `
        // Get nodes, excluding expanded nodes
        MATCH (iteration:Iteration {id: $selectedIteration.id})
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
        RETURN 
            COLLECT(DISTINCT Node) AS resultingNodes
    `;
    console.log("Executing query with params:", params);

    const result = await session.run(query, params);

    // Process the resulting nodes
    const resultingNodes = result.records.map((record) => record.get("resultingNodes"));

    res.status(200).json({
      success: true,
      data: resultingNodes,
    });
  } catch (error) {
    console.error("Error executing Neo4j query:", error);
    res.status(500).json({
      error: "An error occurred while executing the query",
      details: error.message,
    });
  } finally {
    await session.close();
  }
});

module.exports = router;
