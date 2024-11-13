export function generateDagCode(nodes, edges) {
    let code = "dag {\n";
    edges.forEach(edge => {
      code += `  ${edge.source} -> ${edge.target};\n`;
    });
    code += "}";
    return code;
  }
  