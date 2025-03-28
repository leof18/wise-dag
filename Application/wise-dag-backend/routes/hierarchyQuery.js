const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

// Function to build a tree from an array of paths.
// Each path is an array of node names from a root to an allowed node.
function buildTreeFromPaths(paths) {
  const tree = {};
  // Merge each path into a single tree structure.
  for (const path of paths) {
    let current = tree;
    for (const nodeObj of path) {
      const { name, isLeaf } = nodeObj;
      if (!current[name]) {
        // Store both isLeaf and an empty children object.
        current[name] = { isLeaf, children: {} };
      }
      current = current[name].children;
    }
  }
  // Convert the tree object into an array of node objects.
  function convert(nodeObj) {
    return Object.entries(nodeObj).map(([name, data]) => ({
      name,
      isLeaf: data.isLeaf,
      children: convert(data.children)
    }));
  }
  return convert(tree);
}

// API to Fetch Concept Hierarchy (filtered by allowedNodes)
router.get("/hierarchyQuery", async (req, res) => {
  try {
    // Expect allowedNodes to be passed as a comma‐separated list in the query string, e.g. ?allowedNodes=A,B,C
    const allowedNodesParam = req.query.allowedNodes;
    if (!allowedNodesParam) {
      return res.status(400).json({ success: false, error: "allowedNodes parameter required" });
    }
    const allowedNodes = allowedNodesParam.split(",").map(n => n.trim());
    
    const session = driver.session();
    const query = `
      MATCH (allowed:Concept)
      WHERE allowed.name IN $allowedNodes
      OPTIONAL MATCH path = (root:Concept)-[:SUBSUMES*]->(allowed)
        WHERE NOT (root)<-[:SUBSUMES]-(:Concept)
      WITH allowed, path, length(path) AS pathLength
      ORDER BY pathLength DESC
      WITH allowed, collect(path)[0] AS bestPath
      RETURN CASE
        WHEN bestPath IS NOT NULL THEN [n IN nodes(bestPath) | { name: n.name, isLeaf: n.is_leaf_node }]
        ELSE [{ name: allowed.name, isLeaf: allowed.is_leaf_node }]
      END AS pathNodes
    `;
    
    const result = await session.run(query, { allowedNodes });
    const paths = result.records.map(record => record.get("pathNodes"));

    
    // Build a tree from the collected shortest paths.
    const tree = buildTreeFromPaths(paths);
    
    console.log(JSON.stringify(tree, null, 2)); // Log for debugging.
    res.json({ success: true, hierarchy: tree });
  } catch (error) {
    console.error("Error in /hierarchyQuery:", error);
    res.status(500).json({ success: false, error: error.message });
  }
});

module.exports = router;
