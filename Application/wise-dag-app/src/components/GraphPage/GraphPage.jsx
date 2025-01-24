import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import axios from "axios";

const GraphPage = () => {
  const location = useLocation();
  const { exposureName, outcomeName, granularity } = location.state;

  const [nodes, setNodes] = useState([]);
  const [edges, setEdges] = useState([]);
  const [filteredNodes, setFilteredNodes] = useState([]);
  const [currentGranularity, setGranularity] = useState(granularity);

  const fetchGraphData = async (level) => {
    try {
      const response = await axios.get("http://localhost:3001/api/graph-data", {
        params: { granularity: level },
      });

      const data = response.data;

      // Filter exposure and outcome
      const filtered = data.nodes.filter(
        (node) =>
          node.name.toLowerCase() === exposureName.toLowerCase() ||
          node.name.toLowerCase() === outcomeName.toLowerCase()
      );

      setNodes(data.nodes);
      setEdges(data.edges);
      setFilteredNodes(filtered);
    } catch (error) {
      console.error("Error fetching graph data:", error);
    }
  };

  useEffect(() => {
    fetchGraphData(currentGranularity);
  }, [currentGranularity]);

  return (
    <div className="flex flex-col items-center p-6 bg-gray-100 min-h-screen">
      <header className="text-center mb-6">
        <h1 className="text-2xl font-bold">Graph Visualization</h1>
        <p className="text-sm text-gray-600">
          Exposure: {exposureName}, Outcome: {outcomeName}
        </p>
      </header>
      <div className="graph-controls w-full mb-4 flex justify-center">
        <label htmlFor="granularity" className="mr-2">
          Granularity Level:
        </label>
        <input
          id="granularity"
          type="range"
          min="1"
          max="10"
          value={currentGranularity}
          onChange={(e) => setGranularity(e.target.value)}
          className="w-64"
        />
        <span className="ml-2">{currentGranularity}</span>
      </div>
      <div className="graph-container-wrapper flex-1 w-full relative border rounded-lg bg-white p-4">
        {/* Nodes */}
        {nodes.map((node) => (
          <div
            key={node.id.low}
            className={`node absolute bg-blue-300 p-2 rounded-full`}
            style={{ left: `${Math.random() * 80}%`, top: `${Math.random() * 80}%` }}
          >
            {node.name}
          </div>
        ))}
        {/* Edges */}
        <svg className="absolute w-full h-full">
          {edges
            .filter((edge) => edge.source && edge.target) // Skip invalid edges
            .map((edge, index) => {
              const source = nodes.find((node) => node.id.low === edge.source.low);
              const target = nodes.find((node) => node.id.low === edge.target.low);

              if (source && target) {
                return (
                  <line
                    key={index}
                    x1={`${Math.random() * 500}`}
                    y1={`${Math.random() * 500}`}
                    x2={`${Math.random() * 500}`}
                    y2={`${Math.random() * 500}`}
                    stroke="black"
                    strokeWidth="1"
                  />
                );
              }

              return null; // Skip if source/target not found
            })}
        </svg>
      </div>
    </div>
  );
};

export default GraphPage;
