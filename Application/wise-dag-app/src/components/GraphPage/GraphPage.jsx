import { useNavigate } from "react-router-dom";
import React, { useState, useEffect, useRef } from "react";
import { useLocation } from "react-router-dom";
import axios from "axios";
import { AiOutlineZoomIn, AiOutlineZoomOut } from "react-icons/ai";
import { FaEraser } from "react-icons/fa";

const GraphPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  // Expect exposure and outcome to be objects { value: string, type: "none" | "custom" | "predefined" }
  const { 
    exposure = { value: "", type: "none" }, 
    outcome = { value: "", type: "none" } 
  } = location.state || {};
  
  // Track whether the inital fetch was done to prevent duplicate calls
  const [initialFetchDone, setInitialFetchDone] = useState(false);

  const [nodes, setNodes] = useState([]);
  const [granularity, setGranularity] = useState(0);
  const [selectedNodes, setSelectedNodes] = useState([]);
  const transformRef = useRef(null);

  const handleTimepoint = () => {
    if (nodes.length === 0) {
      alert("No nodes available to Dagify!");
      return;
    }
    navigate("/timepoints", {
      state: { granularity, selectedNodes, exposure, outcome, nodes },
    });
  };

  // Graph Space Dimensions
  const GRAPH_HEIGHT = 900;
  
  // FETCH FOR SELECTED ITERATION
  const fetchGraphData = async (iteration, exposure, outcome, selectedNodesList = []) => {
    try {
      // Only include exposure/outcome if they are predefined.
      const requestData = {
        selectedIteration: { id: iteration },
        selectedNodes: selectedNodesList,
      };

      const response = await axios.post(
        "http://localhost:3001/api/granularity-query",
        requestData
      );
      const data = response.data;

      if (data.success) {
        // Map returned data into nodes.
        const extractedNodes = data.data.flat(Infinity).map((node) => ({
          id: node.identity.low,
          name: node.properties.name,
          isExposure:
            exposure &&
            exposure.type === "predefined" &&
            node.properties.name === exposure.value,
          isOutcome:
            outcome &&
            outcome.type === "predefined" &&
            node.properties.name === outcome.value,
          isLeaf: node.properties.is_leaf_node,
          textLength: node.properties.name.length,
        }));

        const sortedNodes = [];
        sortedNodes.push(...extractedNodes);
        setNodes(sortedNodes);

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

  // INITIAL FETCH FOR ITERATION AND SELECTED LIST (where both concepts are present)
  const fetchInitialGraphParams = async (exposure, outcome) => {
    try {
    if (exposure.type !== "predefined" && outcome.type !== "predefined") {
      await fetchGraphData(0, exposure, outcome, []);
      setInitialFetchDone(true);
      return;
    }

      const requestData = {
        exposure: exposure,
        outcome: outcome
      };

      const response = await axios.post(
        "http://localhost:3001/api/initial-graph-query",
        requestData
      );
      const result = response.data;

      if (result.success) {

        const { iteration, initSelectedNodes} = result.data[0];

        setGranularity(iteration);
        setSelectedNodes(initSelectedNodes);

        await fetchGraphData(iteration, exposure, outcome, initSelectedNodes);
        setInitialFetchDone(true);

      } else {
        console.error("Failed to fetch initial graph data:", result.error);
      }
    } catch (error) {
      console.error("Error fetching initial graph data:", error);
    }
  };

  useEffect(() => {
    // eslint-disable-next-line react-hooks/exhaustive-deps
    fetchInitialGraphParams(exposure, outcome);
  }, []);
  
  useEffect(() => {
    if (initialFetchDone) {
      // eslint-disable-next-line react-hooks/exhaustive-deps
      fetchGraphData(granularity, exposure, outcome, []);
    }
  }, [granularity]);


  const handleNodeClick = (node) => {
    if (!node.isLeaf) {
      console.log(`Expanding node: ${node.name} with iteration level ${granularity}`);
      const newSelectedNodes = [...selectedNodes, node.name];
      setSelectedNodes(newSelectedNodes);
      fetchGraphData(granularity, exposure, outcome, newSelectedNodes);
    }
  };

  const handleReset = () => {
    setSelectedNodes([]);
    fetchGraphData(granularity, exposure, outcome, []);
  };

  const handleUndo = () => {
    if (selectedNodes.length === 0) return;
    const newSelectedNodes = selectedNodes.slice(0, -1);
    setSelectedNodes(newSelectedNodes);
    fetchGraphData(granularity, exposure, outcome, newSelectedNodes);
  };

  return (
    <div className="flex flex-col items-center p-6 bg-gray-100 w-full" style={{ height: "calc(100vh - 130px)" }}>
      {/* Fixed Header */}
      <header className="w-full bg-white p-4 rounded-lg shadow-md sticky top-0 z-50">
        <div className="flex">
          <div className="w-3/4">
            <h1 className="text-base font-semibold text-center">Node Selection</h1>
            <p className="text-sm text-center text-gray-600">
              Exposure:{" "}
              <span className="text-red-500 font-semibold">
                {exposure && exposure.type !== "none" ? exposure.value : "Not set"}
              </span>
              , Outcome:{" "}
              <span className="text-red-500 font-semibold">
                {outcome && outcome.type !== "none" ? outcome.value : "Not set"}
              </span>
            </p>
            <div className="mt-2">
              <div className="flex justify-center space-x-2 mb-2">
                <button
                  onClick={handleUndo}
                  className="bg-yellow-500 text-white px-3 py-1 rounded-md shadow-md hover:bg-yellow-600 transition"
                >
                  Undo
                </button>
                <button
                  onClick={handleReset}
                  className="bg-red-500 text-white px-3 py-1 rounded-md shadow-md hover:bg-red-600 transition"
                >
                  Reset Expansion
                </button>
              </div>
              <div className="w-3/4 mx-auto">
                <label htmlFor="granularity-slider" className="block text-sm font-semibold">
                  Granularity Level: {granularity}
                </label>
                <input
                  id="granularity-slider"
                  type="range"
                  min="0"
                  max="74"
                  step="1"
                  value={granularity}
                  onChange={(e) => setGranularity(parseInt(e.target.value, 10))}
                  className="w-full"
                />
              </div>
            </div>
          </div>
          <div className="w-1/4 flex items-center justify-end">
            <button
              onClick={handleTimepoint}
              className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition"
            >
              Select Timepoints
            </button>
          </div>
        </div>
      </header>

      {/* Graph Space */}
      <div
        className="border rounded-lg bg-white p-4 mt-4 overflow-auto"
        style={{
          width: "100%",
          height: `${GRAPH_HEIGHT}px`,
          maxHeight: "80vh",
        }}
      >
        <div
          className="relative"
          style={{
            display: "flex",
            flexWrap: "wrap",
            justifyContent: "flex-start",
            gap: "12px",
            padding: "12px",
          }}
        >
          {nodes.map((node) => (
            <div
              key={node.id}
              className="p-2 rounded-full text-center font-semibold shadow-md cursor-pointer"
              onClick={() => handleNodeClick(node)}
              style={{
                backgroundColor: node.isExposure || node.isOutcome ? "#EF4444" : node.isLeaf ? "#D1D5DB" : "#A7F3D0",
                color: node.isExposure || node.isOutcome ? "white" : "black",
                border: node.isExposure || node.isOutcome ? "2px solid black" : "none",
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
