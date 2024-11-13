// utils/dagCodeGenerator.js

export function generateDagCode(nodes, edges) {
    let code = "dag {\n";
    edges.forEach(edge => {
      code += `  ${edge.source} -> ${edge.target} [label="${edge.direction}"];\n`;
    });
    code += "}";
    return code;
  }
  