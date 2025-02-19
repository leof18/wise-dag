const express = require('express');
const { getSession } = require('../db/neo4j');

const router = express.Router();

// Test Route to Fetch Nodes and Edges for a Specific Granularity
router.get('/test-graph', async (req, res) => {
  const { granularity = 1 } = req.query;
  const session = getSession();
  try {
    // Example Query to Fetch Nodes and Edges
    const result = await session.run(
      `
      MATCH (concept:Concept)-[:PART_OF]->(cluster:Cluster)
      WHERE concept.iteration_level <= $granularity
      OPTIONAL MATCH (concept)-[r:CAUSES]->(related:Concept)
      RETURN 
        collect(DISTINCT {
          id: id(concept),
          name: concept.name,
          type: concept.type,
          iteration_level: concept.iteration_level
        }) AS nodes,
        collect(DISTINCT {
          source: id(concept),
          target: id(related)
        }) AS edges
      `,
      { granularity: parseInt(granularity, 10) }
    );

    const nodes = result.records[0].get('nodes');
    const edges = result.records[0].get('edges');

    res.json({ nodes, edges });
  } catch (error) {
    console.error('Error in /test-graph:', error);
    res.status(500).json({ error: 'An error occurred while fetching data.' });
  } finally {
    session.close();
  }
});

// Test Basic Database Connection
router.get('/test-basic', async (req, res) => {
  const session = getSession();
  try {
    const result = await session.run(`
      MATCH (n) RETURN n LIMIT 5
    `);

    const nodes = result.records.map((record) => record.get(0).properties);

    res.json(nodes);
  } catch (error) {
    console.error('Error in /test-basic:', error);
    res.status(500).json({ error: 'Test query failed.' });
  } finally {
    session.close();
  }
});

module.exports = router;
