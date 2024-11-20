// dataParser.js

export function parseData(data) {
    const nodes = [];
    const edges = [];
  
    data.forEach(row => {
      const exposure = row.Exposure;
      const outcome = row.Outcome;
      const direction = row.Direction;
      const strength = parseFloat(row.Strength);
  
      if (!nodes.some(node => node.id === exposure)) {
        nodes.push({ id: exposure, label: exposure });
      }
      if (!nodes.some(node => node.id === outcome)) {
        nodes.push({ id: outcome, label: outcome });
      }
      edges.push({ source: exposure, target: outcome, direction, strength });
    });
  
    return { nodes, edges };
  }
  