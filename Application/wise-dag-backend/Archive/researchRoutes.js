const express = require("express");
const router = express.Router();
const session = require("../db/neo4j"); // Assuming a reusable session

// Endpoint 1: Validate Exposure and Outcome
router.post("/initialize", async (req, res) => {
  const { exposure, outcome } = req.body;

  if (!exposure || !outcome) {
    return res.status(400).json({ error: "Both exposure and outcome are required." });
  }

  try {
    const result = await session.run(
      `
      MATCH (x:Concept {name: $exposure}), (y:Concept {name: $outcome})
      RETURN x, y
      `,
      { exposure, outcome }
    );

    if (result.records.length === 0) {
      return res.status(404).json({ error: "Exposure or Outcome not found in the database." });
    }

    const exposureNode = result.records[0].get("x");
    const outcomeNode = result.records[0].get("y");

    res.json({
      exposure: {
        id: exposureNode.identity.low,
        name: exposureNode.properties.name,
      },
      outcome: {
        id: outcomeNode.identity.low,
        name: outcomeNode.properties.name,
      },
    });
  } catch (error) {
    console.error("Error in /initialize:", error);
    res.status(500).json({ error: "Failed to initialize the graph." });
  }
});

// Endpoint 2: Fetch Graph Data
router.get("/graph-data", async (req, res) => {
  const { granularity, exposureId, outcomeId } = req.query;

  if (!granularity || !exposureId || !outcomeId) {
    return res.status(400).json({ error: "Granularity, exposureId, and outcomeId are required." });
  }

  try {
    const result = await session.run(
      `
      MATCH (n:Concept)-[r:CAUSES]->(m:Concept)
      WHERE n.iteration_level <= $granularity AND m.iteration_level <= $granularity
        AND id(n) = $exposureId AND id(m) = $outcomeId
      RETURN
        collect({
          id: id(n),
          name: n.name,
          type: n.type
        }) AS nodes,
        collect({
          source: id(startNode(r)),
          target: id(endNode(r))
        }) AS edges
      `,
      {
        granularity: parseInt(granularity, 10),
        exposureId: parseInt(exposureId, 10),
        outcomeId: parseInt(outcomeId, 10),
      }
    );

    const nodes = result.records[0].get("nodes");
    const edges = result.records[0].get("edges");

    res.json({ nodes, edges });
  } catch (error) {
    console.error("Error in /graph-data:", error);
    res.status(500).json({ error: "Failed to fetch graph data." });
  }
});

module.exports = router;
