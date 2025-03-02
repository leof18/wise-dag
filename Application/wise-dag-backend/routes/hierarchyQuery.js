// routes/hierarchy-query.js

const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

// POST /api/hierarchy-query
// Returns ALL (parent)-[:SUBSUMES]->(child) edges in the entire database
router.post("/hierarchy-query", async (req, res) => {
  const session = driver.session();
  try {
    // The query you mentioned:
    // Returns all (parent)-[:SUBSUMES]->(child) pairs, ignoring iteration.
    const query = `
      MATCH (parent:Concept)-[:SUBSUMES]->(child:Concept)
      RETURN parent.name AS parent, child.name AS child
      ORDER BY parent, child
    `;

    const result = await session.run(query);

    // Convert Neo4j records -> array of { parent, child }
    const edges = result.records.map((record) => ({
      parent: record.get("parent"),
      child: record.get("child"),
    }));

    res.json({ success: true, edges });
  } catch (error) {
    console.error("Error in /hierarchy-query:", error);
    res.status(500).json({
      success: false,
      error: error.message,
    });
  } finally {
    await session.close();
  }
});

module.exports = router;
