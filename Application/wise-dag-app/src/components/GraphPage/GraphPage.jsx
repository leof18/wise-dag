import React, { useState } from "react";
import logo from "../../assets/logo.png";
import Node from "../Node/Node";

const GraphPage = () => {
  const [nodes, setNodes] = useState([
    { id: 1, label: "Smoking", type: "input" },
    { id: 2, label: "Stroke", type: "output" },
    { id: 3, label: "Arteriosclerosis", type: "intermediate" },
    { id: 4, label: "...", type: "intermediate" },
    { id: 5, label: "...", type: "intermediate" },
  ]);
  const [granularity, setGranularity] = useState(5);

  const handleNodeEdit = (id, newLabel) => {
    setNodes((prevNodes) =>
      prevNodes.map((node) =>
        node.id === id ? { ...node, label: newLabel } : node
      )
    );
  };

  const handleGranularityChange = (e) => {
    setGranularity(e.target.value);
    console.log("Granularity changed to:", e.target.value);
  };

  const copyToClipboard = () => {
    const graphData = JSON.stringify(nodes, null, 2);
    navigator.clipboard.writeText(graphData);
    alert("DAG code copied to clipboard!");
  };

  return (
    <div className="graph-container">
      <header className="graph-header">
        <img src={logo} alt="Wise-DAG Logo" className="graph-logo" />
        <h2 className="graph-title">
          (info: this is the lowest granularity where we can find X and Y)
        </h2>
      </header>
      <div className="granularity-control">
        <label htmlFor="granularity" className="text-gray-700 font-medium">
          Adjust Granularity:
        </label>
        <input
          id="granularity"
          type="range"
          min="1"
          max="10"
          value={granularity}
          onChange={handleGranularityChange}
          className="granularity-slider"
        />
      </div>
      <div className="graph-nodes">
        {nodes.map((node) => (
          <Node
            key={node.id}
            id={node.id}
            label={node.label}
            type={node.type}
            onEdit={handleNodeEdit}
          />
        ))}
      </div>
      <button onClick={copyToClipboard} className="copy-button">
        Copy Code to Clipboard
      </button>
    </div>
  );
};

export default GraphPage;
