const express = require('express');
const router = express.Router();
const { driver } = require('../db/neo4j');

// Define /api/graph-data endpoint
router.get('/graph-data', async (req, res) => {
  const session = driver.session();
  try {
    // Example query to fetch nodes and edges
    const result = await session.run(`
      MATCH (n)-[r]->(m)
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
    `);

    const nodes = result.records[0].get('nodes');
    const edges = result.records[0].get('edges');

    res.json({ nodes, edges });
  } catch (error) {
    console.error('Error fetching graph data:', error);
    res.status(500).json({ error: 'Internal server error' });
  } finally {
    session.close();
  }
});

module.exports = router;
