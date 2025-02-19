import React, { useEffect, useRef } from "react";
import cytoscape from "cytoscape";
import dagre from "cytoscape-dagre";

cytoscape.use(dagre);

const DagViewer = ({ nodes, edges, onSelectNode }) => {
  const cyRef = useRef(null);

  useEffect(() => {
    if (cyRef.current) {
      cyRef.current.innerHTML = ""; // Clear the container
    }

    if (nodes.length === 0 || edges.length === 0) {
      // Handle empty graph gracefully
      return;
    }

    const cy = cytoscape({
      container: cyRef.current,
      elements: [
        ...nodes.map((node) => ({
          data: { id: node.id, label: node.label },
        })),
        ...edges.map((edge) => ({
          data: {
            source: edge.source,
            target: edge.target,
            label: edge.direction,
          },
        })),
      ],
      style: [
        {
          selector: "node",
          style: {
            "background-color": "#6FB1FC",
            label: "data(label)",
            "text-valign": "center",
            "text-halign": "center",
            "font-size": "12px",
          },
        },
        {
          selector: "edge",
          style: {
            "curve-style": "bezier",
            width: 2,
            "line-color": "#ccc",
            "target-arrow-color": "#ccc",
            "target-arrow-shape": "triangle",
            "label": "data(label)",
          },
        },
      ],
      layout: {
        name: "dagre",
        directed: true,
        padding: 10,
      },
    });

    cy.on("tap", "node", (event) => {
      const node = event.target;
      onSelectNode(node.data());
    });

    return () => cy.destroy(); // Cleanup Cytoscape instance
  }, [nodes, edges, onSelectNode]);

  return <div ref={cyRef} style={{ width: "100%", height: "100%" }} />;
};

export default DagViewer;
