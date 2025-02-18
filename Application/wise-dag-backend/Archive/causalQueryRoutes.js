const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

router.post("/causal-query", async (req, res) => {
  const { selectedIteration, selectedNodes, selectedConfidence } = req.body;

  // Validate required parameters
  if (!selectedIteration || !selectedNodes || !selectedConfidence) {
    return res.status(400).json({
      error: "Missing required parameters: selectedIteration, selectedNodes, or selectedConfidence",
    });
  }

  const session = driver.session();

  try {
    const query = `
      
        MATCH (iteration:Iteration {id: $selectedIteration.id})
        MATCH (excludedNodes:Concept)
        WHERE excludedNodes.name IN $selectedNodes.name
        MATCH (concept:Concept)-[:PART_OF]->(iteration)
        WITH collect(concept) AS initialConcepts, excludedNodes
        MATCH (excludedNodes)-[:SUBSUMES]->(child:Concept)
        WITH initialConcepts, collect(child) AS children
        WITH initialConcepts + children AS combinedNodes
        WITH [node IN combinedNodes WHERE NOT node.name IN $selectedNodes.name] AS finalNodes
        UNWIND finalNodes AS finalNode
        OPTIONAL MATCH (finalNode)-[causal:CAUSES]->(relatedFinalNode:Concept)
        WHERE causal.confidence_mean > $selectedConfidence.score
        WITH finalNode, COLLECT(causal) AS causalRelationships
        RETURN COLLECT(DISTINCT finalNode) AS resultingNodes, causalRelationships;
    `;

    const params = {
      selectedIteration,
      selectedNodes,
      selectedConfidence,
    };

    console.log("Executing query with params:", params);

    const result = await session.run(query, params);

    const resultingNodes = result.records.map((record) => {
      return {
        nodes: record.get("resultingNodes"),
        causal: record.get("causal"),
      };
    });

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
