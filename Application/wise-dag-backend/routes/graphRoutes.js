const express = require("express");
const router = express.Router(); // Initialize the router
const neo4j = require("../db/neo4j");

// Define routes
router.get("/exposure-outcome", async (req, res) => {
  try {
    const session = neo4j.session();
    const result = await session.run(`
      MATCH (exposure:Concept)-[r:CAUSES]->(outcome:Concept)
      RETURN exposure.name AS exposureName, outcome.name AS outcomeName
    `);

    const data = result.records.map((record) => ({
      exposure: record.get("exposureName"),
      outcome: record.get("outcomeName"),
    }));

    session.close();
    res.json(data);
  } catch (error) {
    console.error("Error fetching exposure-outcome data:", error);
    res.status(500).json({ error: "Internal server error" });
  }
});

module.exports = router;
