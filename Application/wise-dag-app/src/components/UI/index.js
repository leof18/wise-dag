// src/components/DagEditor.js
import React, { useEffect, useRef, useState } from "react";
import cytoscape from "cytoscape";
import dagre from "cytoscape-dagre";

cytoscape.use(dagre);

const DagEditor = ({ nodes, edges, onUpdateGraph }) => {
  const cyRef = useRef(null);
  const [cy, setCy] = useState(null);

  useEffect(() => {
    // Initialize Cytoscape
    const cyInstance = cytoscape({
      container: cyRef.current,
      elements: [
        ...nodes.map((node) => ({
          data: { id: node.id, label: node.label || "" },
        })),
        ...edges.map((edge) => ({
          data: {
            source: edge.source,
            target: edge.target,
            strength: edge.strength,
            direction: edge.direction,
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
            "font-size": "10px",
            "text-wrap": "wrap",
            "color": "#000",
          },
        },
        {
          selector: "edge",
          style: {
            "curve-style": "bezier",
            width: 2,
            "line-color": "#ccc",
            "target-arrow-color": "#ccc",
            "target-arrow-shape": (ele) =>
              ele.data("direction") === "increase" ? "triangle" : "none",
            "source-arrow-shape": (ele) =>
              ele.data("direction") === "decrease" ? "triangle" : "none",
            "label": "data(strength)",
            "font-size": "8px",
            "text-background-opacity": 0.5,
          },
        },
      ],
      layout: {
        name: "dagre",
        directed: true,
        padding: 10,
      },
    });

    // Node select handler
    cyInstance.on("tap", "node", (event) => {
      const node = event.target;
      console.log("Selected Node:", node.data());
    });

    // Set Cytoscape instance
    setCy(cyInstance);

    return () => {
      cyInstance.destroy();
    };
  }, [nodes, edges]);

  // Update graph dynamically
  useEffect(() => {
    if (cy) {
      cy.json({
        elements: {
          nodes: nodes.map((node) => ({
            data: { id: node.id, label: node.label || "" },
          })),
          edges: edges.map((edge) => ({
            data: {
              source: edge.source,
              target: edge.target,
              strength: edge.strength,
              direction: edge.direction,
            },
          })),
        },
      });
      cy.layout({ name: "dagre", directed: true }).run();
    }
  }, [nodes, edges, cy]);

  return (
    <div style={{ height: "100%", width: "100%" }}>
      <div
        ref={cyRef}
        style={{
          height: "600px",
          width: "100%",
          border: "1px solid #ddd",
          backgroundColor: "#f9f9f9",
        }}
      />
    </div>
  );
};

export default DagEditor;
