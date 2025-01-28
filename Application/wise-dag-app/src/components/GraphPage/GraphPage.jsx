import React, { useState, useEffect } from "react";
import { useLocation } from "react-router-dom";
import axios from "axios";
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch";
import { AiOutlineZoomIn, AiOutlineZoomOut } from "react-icons/ai";
import { FaEraser } from "react-icons/fa";

const GraphPage = () => {
  const location = useLocation();
  const { exposure, outcome } = location.state;

  const [nodes, setNodes] = useState([]);
  const [granularity, setGranularity] = useState(0);

  // Graph Space Dimensions
  const GRAPH_WIDTH = 1600;
  const GRAPH_HEIGHT = 900;
  const BASE_NODE_SPACING_X = 220; // Default horizontal spacing
  const BASE_NODE_SPACING_Y = 100; // Default vertical spacing

  const fetchGraphData = async (level) => {
    try {
      const response = await axios.post("http://localhost:3001/api/granularity-query", {
        selectedIteration: { id: level },
        selectedNodes: { name: [exposure, outcome] },
      });

      const data = response.data;

      if (data.success) {
        const extractedNodes = data.data.flat(Infinity).map((node) => ({
          id: node.identity.low,
          name: node.properties.name,
          isExposure: node.properties.name === exposure,
          isOutcome: node.properties.name === outcome,
          textLength: node.properties.name.length, // Track text length for spacing
        }));

        const uniqueNodes = [
          { id: "exposure", name: exposure, isExposure: true, textLength: exposure.length },
          { id: "outcome", name: outcome, isOutcome: true, textLength: outcome.length },
          ...extractedNodes.filter((n) => n.name !== exposure && n.name !== outcome),
        ];

        const totalNodes = uniqueNodes.length;
        const cols = Math.ceil(Math.sqrt(totalNodes));
        const rows = Math.ceil(totalNodes / cols);

        // Adjust spacing dynamically based on text length
        const positionedNodes = uniqueNodes.map((node, index) => {
          const dynamicSpacingX = BASE_NODE_SPACING_X + node.textLength * 4; // Expand if text is long
          return {
            ...node,
            x: Math.min((index % cols) * dynamicSpacingX + 100, GRAPH_WIDTH - dynamicSpacingX),
            y: Math.min(Math.floor(index / cols) * BASE_NODE_SPACING_Y + 100, GRAPH_HEIGHT - BASE_NODE_SPACING_Y),
          };
        });

        setNodes(positionedNodes);
      } else {
        console.error("Failed to fetch graph data:", data.error);
      }
    } catch (error) {
      console.error("Error fetching graph data:", error);
    }
  };

  useEffect(() => {
    setNodes([]);
    fetchGraphData(granularity);
  }, [granularity]);

  return (
    <div className="flex flex-col items-center p-6 bg-gray-100 min-h-screen w-full">
      <header className="w-full text-center mb-4">
        <h1 className="text-2xl font-bold">Graph Visualization</h1>
        <p className="text-sm text-gray-600">
          Exposure: <span className="text-red-500 font-semibold">{exposure}</span>, Outcome:{" "}
          <span className="text-red-500 font-semibold">{outcome}</span>
        </p>
      </header>

      {/* Granularity Slider */}
      <div className="w-full flex flex-col items-center mb-4">
        <label htmlFor="granularity-slider" className="mb-2 text-lg font-semibold">
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

      {/* Graph Space */}
      <div
        className="relative border rounded-lg bg-white p-4 overflow-hidden"
        style={{ width: `${GRAPH_WIDTH}px`, height: `${GRAPH_HEIGHT}px` }}
      >
        {/* Zoom Controls */}
        <TransformWrapper initialScale={1} minScale={0.5} maxScale={3} centerOnInit>
          {({ zoomIn, zoomOut, resetTransform }) => (
            <>
              <div className="absolute top-4 right-4 flex space-x-2 bg-white p-2 rounded-lg shadow-md">
                <button onClick={() => zoomIn()} className="p-2 bg-gray-200 rounded">
                  <AiOutlineZoomIn size={20} />
                </button>
                <button onClick={() => zoomOut()} className="p-2 bg-gray-200 rounded">
                  <AiOutlineZoomOut size={20} />
                </button>
                <button onClick={() => resetTransform()} className="p-2 bg-gray-200 rounded">
                  <FaEraser size={20} />
                </button>
              </div>

              <TransformComponent>
                {/* Graph Nodes */}
                <div className="relative" style={{ width: GRAPH_WIDTH, height: GRAPH_HEIGHT }}>
                  {nodes.map((node) => (
                    <div
                      key={node.id}
                      className="absolute p-2 rounded-full text-center font-semibold shadow-md"
                      style={{
                        left: `${node.x}px`,
                        top: `${node.y}px`,
                        backgroundColor: node.isExposure || node.isOutcome ? "#EF4444" : "#A7F3D0",
                        color: node.isExposure || node.isOutcome ? "white" : "black",
                        border: node.isExposure || node.isOutcome ? "2px solid black" : "none",
                        transform: "translate(-50%, -50%)",
                        minWidth: `${node.textLength * 6}px`, // Prevents text from overlapping
                        whiteSpace: "nowrap",
                        padding: "6px 12px",
                      }}
                    >
                      {node.name}
                    </div>
                  ))}
                </div>
              </TransformComponent>
            </>
          )}
        </TransformWrapper>
      </div>
    </div>
  );
};

export default GraphPage;
