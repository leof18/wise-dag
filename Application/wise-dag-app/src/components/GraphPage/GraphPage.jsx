import { useNavigate } from 'react-router-dom';
import React, { useState, useEffect, useRef } from "react";
import { useLocation } from "react-router-dom";
import axios from "axios";
import { AiOutlineZoomIn, AiOutlineZoomOut } from "react-icons/ai";
import { FaEraser } from "react-icons/fa";

const GraphPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { exposure, outcome } = location.state;

  const [nodes, setNodes] = useState([]);
  const [granularity, setGranularity] = useState(0);
  const transformRef = useRef(null);

  const handleTimepoint = () => {
    if (nodes.length === 0) {
      alert("No nodes available to Dagify!");
      return;
    }
    // Navigating to timepointpage with selected nodes
    navigate("/timepoints", { state: { selectedNodes: nodes } });
  };

  // Graph Space Dimensions
  const GRAPH_HEIGHT = 900;

  const fetchGraphData = async (level, selectedNode = null) => {
    try {
      const requestData = {
        selectedIteration: { id: level },
        selectedNodes: selectedNode
          ? { name: [selectedNode] }
          : { name: [exposure, outcome] },
      };

      const response = await axios.post(
        "http://localhost:3001/api/granularity-query",
        requestData
      );
      const data = response.data;

      if (data.success) {
        const extractedNodes = data.data.flat(Infinity).map((node) => ({
          id: node.identity.low,
          name: node.properties.name,
          isExposure: node.properties.name === exposure,
          isOutcome: node.properties.name === outcome,
          isLeaf: node.properties.is_leaf_node,
          textLength: node.properties.name.length,
        }));

        const sortedNodes = [
          {
            id: "exposure",
            name: exposure,
            isExposure: true,
            isLeaf: false,
            textLength: exposure.length,
          },
          ...extractedNodes.filter(
            (n) => n.name !== exposure && n.name !== outcome
          ),
          {
            id: "outcome",
            name: outcome,
            isOutcome: true,
            isLeaf: false,
            textLength: outcome.length,
          },
        ];

        setNodes(sortedNodes);

        if (transformRef.current) {
          setTimeout(() => {
            transformRef.current.centerView(0.5, 200); // Ensure it starts zoomed out
          }, 300);
        }
      } else {
        console.error("Failed to fetch graph data:", data.error);
      }
    } catch (error) {
      console.error("Error fetching graph data:", error);
    }
  };

  useEffect(() => {
    fetchGraphData(granularity);
  }, [granularity]);

  const handleNodeClick = (node) => {
    if (!node.isLeaf) {
      console.log(
        `Expanding node: ${node.name} with iteration level ${granularity}`
      );
      fetchGraphData(granularity, node.name);
    }
  };

  return (
    <div className="flex flex-col items-center p-6 bg-gray-100 w-full"
    style={{ height: "calc(100vh - 130px)" }}>
      {/* Fixed Header with Granularity Slider + Zoom Buttons */}
      <header className="w-full flex justify-between items-center bg-white p-4 rounded-lg shadow-md mb-4 sticky top-0 z-50">
        <div className="flex flex-col items-center flex-grow">
          <h1 className="text-2xl font-bold">Node Selection</h1>
          <p className="text-sm text-gray-600">
            Exposure:{" "}
            <span className="text-red-500 font-semibold">{exposure}</span>,
            Outcome:{" "}
            <span className="text-red-500 font-semibold">{outcome}</span>
          </p>

          {/* Granularity Slider */}
          <div className="w-full flex flex-col items-center mt-2">
            <label
              htmlFor="granularity-slider"
              className="text-lg font-semibold"
            >
              Granularity Level: {granularity}
            </label>
            <input
              id="granularity-slider"
              type="range"
              min="0"
              max="74"
              step="1"
              value={granularity}
              onChange={(e) => setGranularity(parseInt(e.target.value))}
              className="w-full"
            />
          </div>
        </div>

        {/* Dagify Button */}
  <button
    onClick={handleTimepoint}
    className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition"
  >
    Select Timepoints
  </button>

        
      </header>

      {/* Graph Space */}
      <div
        className="border rounded-lg bg-white p-4 mt-4 overflow-auto"
        style={{
          width: "100%",
          height: `${GRAPH_HEIGHT}px`,
          maxHeight: "80vh", // Prevents it from overflowing the screen
        }}
      >
        <div
          className="relative"
          style={{
            display: "flex",
            flexWrap: "wrap", // Ensures horizontal spread first
            justifyContent: "flex-start", // Aligns items properly
            gap: "12px", // Adds space between nodes
            padding: "12px",
          }}
        >
          {nodes.map((node) => (
            <div
              key={node.id}
              className="p-2 rounded-full text-center font-semibold shadow-md cursor-pointer"
              onClick={() => handleNodeClick(node)}
              style={{
                backgroundColor:
                  node.isExposure || node.isOutcome
                    ? "#EF4444"
                    : node.isLeaf
                    ? "#D1D5DB"
                    : "#A7F3D0",
                color: node.isExposure || node.isOutcome ? "white" : "black",
                border:
                  node.isExposure || node.isOutcome
                    ? "2px solid black"
                    : "none",
                    height: "140px",
                    width: "140px",
                    padding: "6px 12px",
                    margin: "8px",
                    alignContent: "center",
              }}
            >
              {node.name}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default GraphPage;
