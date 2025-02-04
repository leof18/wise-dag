import React, { useState, useEffect, useRef } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import axios from "axios";
import { TransformWrapper, TransformComponent } from "react-zoom-pan-pinch";
import { AiOutlineZoomIn, AiOutlineZoomOut } from "react-icons/ai";
import { FaEraser } from "react-icons/fa";

const GraphPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { exposure, outcome } = location.state;

  const [nodes, setNodes] = useState([]);
  const [granularity, setGranularity] = useState(0);
  const transformRef = useRef(null);

  const GRAPH_WIDTH = 1600;
  const GRAPH_HEIGHT = 900;
  const BASE_NODE_SPACING_X = 220;
  const BASE_NODE_SPACING_Y = 120;

  const fetchGraphData = async (level, selectedNode = null) => {
    try {
      const requestData = {
        selectedIteration: { id: level },
        selectedNodes: selectedNode ? { name: [selectedNode] } : { name: [exposure, outcome] },
      };

      const response = await axios.post("http://localhost:3001/api/granularity-query", requestData);
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
          { id: "exposure", name: exposure, isExposure: true, isLeaf: false, textLength: exposure.length },
          ...extractedNodes.filter((n) => n.name !== exposure && n.name !== outcome),
          { id: "outcome", name: outcome, isOutcome: true, isLeaf: false, textLength: outcome.length },
        ];

        let currentX = 100;
        let currentY = 100;
        let maxHeightInRow = BASE_NODE_SPACING_Y;

        const positionedNodes = sortedNodes.map((node, index) => {
          const nodeWidth = node.textLength * 10 + 50;
          const nextX = currentX + nodeWidth + 20;

          if (nextX > GRAPH_WIDTH - 150) {
            currentX = 100;
            currentY += maxHeightInRow;
            maxHeightInRow = BASE_NODE_SPACING_Y;
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

        if (transformRef.current) {
          setTimeout(() => {
            transformRef.current.centerView(0.5, 200);
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
      console.log(`Expanding node: ${node.name} with iteration level ${granularity}`);
      fetchGraphData(granularity, node.name);
    }
  };

  const handleDagify = () => {
    navigate("/dagitty", { state: { selectedNodes: nodes } });
  };

  return (
    <TransformWrapper
      initialScale={0.5}
      minScale={0.3}
      maxScale={3}
      centerOnInit
      wheel={{ step: 0.1 }}
      ref={transformRef}
    >
      {({ zoomIn, zoomOut, resetTransform, centerView }) => {
        transformRef.current = { zoomIn, zoomOut, resetTransform, centerView };

        return (
          <div className="flex flex-col items-center p-6 bg-gray-100 min-h-screen w-full">
            <header className="w-full flex justify-between items-center bg-white p-4 rounded-lg shadow-md mb-4 sticky top-0 z-50">
              <div className="flex flex-col items-center flex-grow">
                <h1 className="text-2xl font-bold">Graph Visualization</h1>
                <p className="text-sm text-gray-600">
                  Exposure: <span className="text-red-500 font-semibold">{exposure}</span>, Outcome: {" "}
                  <span className="text-red-500 font-semibold">{outcome}</span>
                </p>

                <div className="w-full flex flex-col items-center mt-2">
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
                </div>
              </div>

              <div className="flex space-x-2 bg-gray-100 p-2 rounded-lg shadow-md">
                <button onClick={() => transformRef.current.zoomIn()} className="p-2 bg-gray-200 rounded">
                  <AiOutlineZoomIn size={20} />
                </button>
                <button onClick={() => transformRef.current.zoomOut()} className="p-2 bg-gray-200 rounded">
                  <AiOutlineZoomOut size={20} />
                </button>
                <button onClick={() => transformRef.current.resetTransform()} className="p-2 bg-gray-200 rounded">
                  <FaEraser size={20} />
                </button>
              </div>
            </header>

            <div className="relative border rounded-lg bg-white p-4 overflow-hidden mt-4" style={{ width: `${GRAPH_WIDTH}px`, height: `${GRAPH_HEIGHT}px` }}>
              <TransformComponent>
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
                      }}
                    >
                      {node.name}
                    </div>
                  ))}
                </div>
              </TransformComponent>
            </div>

            <button onClick={handleDagify} className="mt-6 px-6 py-3 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-600">
              Dagify Selection
            </button>
          </div>
        );
      }}
    </TransformWrapper>
  );
};

export default GraphPage;