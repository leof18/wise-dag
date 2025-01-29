import React, { useState, useEffect, useRef } from "react";
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

  // Refs to store zoom functions
  const zoomInRef = useRef(null);
  const zoomOutRef = useRef(null);
  const resetTransformRef = useRef(null);

  // Graph Space Dimensions
  const GRAPH_WIDTH = 1600;
  const GRAPH_HEIGHT = 900;
  const BASE_NODE_SPACING_X = 220; // Default horizontal spacing
  const BASE_NODE_SPACING_Y = 120; // Default vertical spacing

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
          isLeaf: node.properties.is_leaf_node, // Determines if node is clickable
          textLength: node.properties.name.length, // Track text length for spacing
        }));

        const uniqueNodes = [
          { id: "exposure", name: exposure, isExposure: true, isLeaf: false, textLength: exposure.length },
          { id: "outcome", name: outcome, isOutcome: true, isLeaf: false, textLength: outcome.length },
          ...extractedNodes.filter((n) => n.name !== exposure && n.name !== outcome),
        ];

        const totalNodes = uniqueNodes.length;
        const cols = Math.ceil(Math.sqrt(totalNodes));
        const rows = Math.ceil(totalNodes / cols);

        // Dynamically calculate max widths per row
        let currentX = 100; // Start X position
        let currentY = 100; // Start Y position
        let maxHeightInRow = BASE_NODE_SPACING_Y;

        const positionedNodes = uniqueNodes.map((node, index) => {
          const nodeWidth = node.textLength * 10 + 50; // Expand width dynamically
          const nextX = currentX + nodeWidth + 20; // Next X position

          if (nextX > GRAPH_WIDTH - 150) {
            // Move to new row if exceeding width
            currentX = 100;
            currentY += maxHeightInRow;
            maxHeightInRow = BASE_NODE_SPACING_Y; // Reset row height
          }

          const positionedNode = {
            ...node,
            x: currentX,
            y: currentY,
          };

          currentX += nodeWidth + 20;
          maxHeightInRow = Math.max(maxHeightInRow, BASE_NODE_SPACING_Y);

          return positionedNode;
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

  const handleNodeClick = (node) => {
    if (!node.isLeaf) {
      console.log(`Expanding node: ${node.name} with iteration level ${granularity}`);
      // Add logic here to fetch expanded node data
    }
  };

  return (
    <TransformWrapper
      initialScale={1}
      minScale={0.5}
      maxScale={3}
      centerOnInit
      wheel={{ step: 0.1 }} // Optional: Smooth zooming with mouse wheel
    >
      {({ zoomIn, zoomOut, resetTransform }) => {
        // Store functions in refs so header buttons can access them
        zoomInRef.current = zoomIn;
        zoomOutRef.current = zoomOut;
        resetTransformRef.current = resetTransform;

        return (
          <div className="flex flex-col items-center p-6 bg-gray-100 min-h-screen w-full">
            {/* Fixed Header Section (Now Includes Granularity Slider + Zoom Controls) */}
            <header className="w-full flex flex-col items-center bg-white p-4 rounded-lg shadow-md mb-4 sticky top-0 z-50">
              <h1 className="text-2xl font-bold">Graph Visualization</h1>
              <p className="text-sm text-gray-600">
                Exposure: <span className="text-red-500 font-semibold">{exposure}</span>, Outcome:{" "}
                <span className="text-red-500 font-semibold">{outcome}</span>
              </p>

              {/* Granularity Slider and Zoom Controls Together */}
              <div className="w-full flex flex-col items-center mt-3 space-y-2">
                {/* Granularity Slider */}
                <label htmlFor="granularity-slider" className="text-lg font-semibold">
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

                {/* Zoom Controls Inside Header */}
                <div className="flex space-x-2 bg-gray-100 p-2 rounded-lg shadow-md">
                  <button onClick={() => zoomInRef.current()} className="p-2 bg-gray-200 rounded">
                    <AiOutlineZoomIn size={20} />
                  </button>
                  <button onClick={() => zoomOutRef.current()} className="p-2 bg-gray-200 rounded">
                    <AiOutlineZoomOut size={20} />
                  </button>
                  <button onClick={() => resetTransformRef.current()} className="p-2 bg-gray-200 rounded">
                    <FaEraser size={20} />
                  </button>
                </div>
              </div>
            </header>

            {/* Graph Space */}
            <div
              className="relative border rounded-lg bg-white p-4 overflow-hidden"
              style={{ width: `${GRAPH_WIDTH}px`, height: `${GRAPH_HEIGHT}px` }}
            >
              <TransformComponent>
                {/* Graph Nodes */}
                <div className="relative" style={{ width: GRAPH_WIDTH, height: GRAPH_HEIGHT }}>
                  {nodes.map((node) => (
                    <div
                      key={node.id}
                      className="absolute p-2 rounded-full text-center font-semibold shadow-md cursor-pointer"
                      onClick={() => handleNodeClick(node)}
                      style={{
                        left: `${node.x}px`,
                        top: `${node.y}px`,
                        backgroundColor: node.isExposure || node.isOutcome ? "#EF4444" : node.isLeaf ? "#D1D5DB" : "#A7F3D0",
                        color: node.isExposure || node.isOutcome ? "white" : "black",
                        border: node.isExposure || node.isOutcome ? "2px solid black" : "none",
                        transform: "translate(-50%, -50%)",
                        minWidth: `${node.textLength * 10}px`, // Expands box width for long names
                        whiteSpace: "nowrap",
                        padding: "6px 12px",
                      }}
                    >
                      {node.name}
                    </div>
                  ))}
                </div>
              </TransformComponent>
            </div>
          </div>
        );
      }}
    </TransformWrapper>
  );
};

export default GraphPage;
