const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

// Function to convert adjacency list to properly nested tree
function buildTree(adjacencyList) {
  const nodeMap = new Map();
  const childParentMap = new Map();

  // Step 1: Create nodes and track their minimum depth
  adjacencyList.forEach(({ parent, children }) => {
    if (!nodeMap.has(parent)) {
      nodeMap.set(parent, { name: parent, children: [] });
    }

    children.forEach(({ name, depth }) => {
      if (!nodeMap.has(name)) {
        nodeMap.set(name, { name, children: [], depth });
      }

      // Track the lowest depth at which a child appears
      if (!childParentMap.has(name) || depth < childParentMap.get(name)) {
        childParentMap.set(name, depth);
      }
    });
  });

  // Step 2: Assign children correctly
  adjacencyList.forEach(({ parent, children }) => {
    children.forEach(({ name, depth }) => {
      const childNode = nodeMap.get(name);
      const parentNode = nodeMap.get(parent);

      // Only add child to parent if it's appearing at the correct depth
      if (childParentMap.get(name) === depth) {
        if (!parentNode.children.some(c => c.name === childNode.name)) {
          parentNode.children.push(childNode);
        }
      }
    });
  });

  // Step 3: Return only root-level nodes (nodes that are never a child)
  return Array.from(nodeMap.values()).filter(
    node => !childParentMap.has(node.name)
  );
}

// API to Fetch Concept Hierarchy
router.get("/hierarchyQuery", async (req, res) => {
  try {
    const session = driver.session();
    const query = `
      MATCH (parent:Concept)-[:SUBSUMES*]->(child:Concept)
      WITH parent, child, length(shortestPath((parent)-[:SUBSUMES*]->(child))) AS depth
      WITH parent.name AS Parent, collect({name: child.name, depth: depth}) AS Children
      RETURN Parent, Children
      ORDER BY Parent
    `;

    const result = await session.run(query);
    const adjacencyList = result.records.map((record) => ({
      parent: record.get("Parent"),
      children: record.get("Children"),
    }));

    // ✅ Ensure `tree` is defined before use
    const tree = buildTree(adjacencyList);

    console.log(JSON.stringify(tree, null, 2)); // ✅ Log tree to check output

    res.json({ success: true, hierarchy: tree });
  } catch (error) {
    console.error("Error in /hierarchyQuery:", error);
    res.status(500).json({ success: false, error: error.message });
  }
});

module.exports = router;
