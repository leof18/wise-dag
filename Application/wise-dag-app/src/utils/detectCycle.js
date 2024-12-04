// utils/detectCycle.js
export function detectCycle(nodes, edges) {
    const adjacencyList = nodes.reduce((acc, node) => {
      acc[node.id] = [];
      return acc;
    }, {});
  
    edges.forEach((edge) => {
      adjacencyList[edge.source].push(edge.target);
    });
  
    const visited = new Set();
    const stack = new Set();
  
    const visit = (node) => {
      if (stack.has(node)) return true; // Cycle detected
      if (visited.has(node)) return false;
  
      visited.add(node);
      stack.add(node);
  
      for (const neighbor of adjacencyList[node]) {
        if (visit(neighbor)) return true;
      }
  
      stack.delete(node);
      return false;
    };
  
    for (const node of nodes) {
      if (visit(node.id)) return true;
    }
    return false;
  }
  