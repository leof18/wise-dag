const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

router.post("/granularity-query", async (req, res) => {
  const { selectedIteration, selectedNodes } = req.body;

  // Validate required parameters
  if (!selectedIteration || !selectedNodes) {
    return res.status(400).json({
      error: "Missing required parameters: selectedIteration, selectedNodes",
    });
  }

  const session = driver.session();

  try {
    // Adjust query based on whether selectedNodes.name is empty
    const isExcludedNodesEmpty = selectedNodes.name.length === 0;

    const query = `
      MATCH (iteration:Iteration {id: $selectedIteration.id})
        MATCH (concept:Concept)-[:PART_OF]->(iteration)
        WITH collect(concept) AS initialConcepts
        OPTIONAL MATCH (excludedNodes:Concept)
        WHERE $selectedNodes.name <> [""] AND excludedNodes.name IN $selectedNodes.name
        OPTIONAL MATCH (excludedNodes)-[:SUBSUMES]->(child:Concept)
        WITH initialConcepts, collect(child) AS children, excludedNodes
        WITH initialConcepts + children AS combinedNodes, excludedNodes
        WITH CASE 
                WHEN $selectedNodes.name = [""] THEN combinedNodes
                ELSE [node IN combinedNodes WHERE NOT node.name IN $selectedNodes.name]
            END AS finalNodes
        RETURN COLLECT(DISTINCT finalNodes) AS resultingNodes;
    `;

    const params = {
      selectedIteration,
      selectedNodes,
    };

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
