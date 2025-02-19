const express = require('express');
const { getSession } = require('../db/neo4j');

const router = express.Router();

// Fetch all available iteration levels
router.get('/iteration-levels', async (req, res) => {
  const session = getSession();
  try {
    const query = `
      MATCH (i:Iteration)
      RETURN collect({ level: i.iteration_level, description: i.description }) AS iterationLevels
    `;
    const result = await session.run(query);

    const iterationLevels = result.records[0].get('iterationLevels');
    res.json({ iterationLevels });
  } catch (error) {
    console.error('Error fetching iteration levels:', error);
    res.status(500).json({ error: 'Failed to fetch iteration levels' });
  } finally {
    session.close();
  }
});

module.exports = router;
