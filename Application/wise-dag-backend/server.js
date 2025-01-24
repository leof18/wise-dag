const driver = require("./db/neo4j");

// Fetch graph data based on granularity
const getGraphData = async (req, res) => {
  const granularity = parseInt(req.query.granularity, 10);

  if (isNaN(granularity) || granularity < 1) {
    return res.status(400).json({ error: "Invalid granularity level" });
  }

  const session = driver.session();
  try {
    const result = await session.run(
      `
      MATCH (n:Concept)-[r:CAUSES]->(m:Concept)
      WHERE n.iteration_level <= $granularity AND m.iteration_level <= $granularity
      RETURN 
        collect({
          id: id(n),
          label: n.name,
          type: n.type,
          iteration_level: n.iteration_level
        }) AS nodes,
        collect({
          source: id(startNode(r)),
          target: id(endNode(r)),
          relationshipType: type(r)
        }) AS edges
      `,
      { granularity }
    );

    const nodes = result.records[0]?.get("nodes") || [];
    const edges = result.records[0]?.get("edges") || [];

    res.json({ nodes, edges });
  } catch (error) {
    console.error("Error fetching graph data:", error);
    res.status(500).json({ error: "Failed to fetch graph data" });
  } finally {
    await session.close();
  }
};

// Fetch iteration levels (placeholder for example)
const getIterationLevel = async (req, res) => {
  const session = driver.session();
  try {
    const result = await session.run(
      `
      MATCH (i:IterationLevel)
      RETURN i.level AS level, i.description AS description
      `
    );

    const levels = result.records.map((record) => ({
      level: record.get("level"),
      description: record.get("description"),
    }));

    res.json({ levels });
  } catch (error) {
    console.error("Error fetching iteration levels:", error);
    res.status(500).json({ error: "Failed to fetch iteration levels" });
  } finally {
    await session.close();
  }
};

module.exports = { getGraphData, getIterationLevel };
