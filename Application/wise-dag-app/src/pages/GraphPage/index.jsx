import { useNavigate, useLocation } from "react-router-dom";
import React, { useState, useEffect, useCallback, useRef } from "react";
import axios from "axios";
import { motion } from "framer-motion";
import "tailwindcss/tailwind.css";
import debounce from "lodash/debounce";

const API_URL =
  process.env.NODE_ENV === "development"
    ? "http://localhost:3001" // Change this to your local backend URL
    : process.env.REACT_APP_WEB_API_URL;

// External helper function to recursively sort the hierarchy alphabetically.
function sortHierarchy(nodes) {
  return nodes
    .map((node) => ({
      ...node,
      children: node.children ? sortHierarchy(node.children) : [],
    }))
    .sort((a, b) => a.name.localeCompare(b.name));
}

// --- Main Component ---
const GraphPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { exposure = { value: "", type: "none" }, outcome = { value: "", type: "none" } } = location.state || {};

  // ----- State Variables -----
  // Hierarchy state for folder structure view.
  const [hierarchy, setHierarchy] = useState([]);
  // Graph data: the leaf nodes returned by the backend.
  const [nodes, setNodes] = useState([]);
  // Iteration parameter.
  const [granularity, setGranularity] = useState(0);
  // New state for immediate slider feedback.
  const [sliderValue, setSliderValue] = useState(0);
  // "selectedNodes" is used solely as the expansion parameter for the graph query.
  const [selectedNodes, setSelectedNodes] = useState([]);
  // chosenNodes: by default all nodes returned by fetchGraphData; used for the query on next page.
  const [chosenNodes, setChosenNodes] = useState([]);
  // excludedNodes holds the nodes that the user has deselected.
  const [excludedNodes, setExcludedNodes] = useState([]);
  // Flag to indicate initial fetch is complete.
  const [initialFetchDone, setInitialFetchDone] = useState(false);
  // Instructions modal visibility.
  const [showInstructions, setShowInstructions] = useState(true);

  const computeChosenNodes = (nodeList, excluded) =>
    nodeList.map(n => n.name).filter(name => !excluded.includes(name));

  // Debounced update: updates granularity after a delay.
  const debouncedSetGranularity = useCallback(
    debounce((newGranularity) => {
      setGranularity(newGranularity);
    }, 300),  // 300ms delay
    []
  );

  // (Optional) ref used for view adjustments.
  const transformRef = useRef(null);

  // ----- Data Fetching Functions -----
  // Fetch graph data (leaf nodes) for the given iteration and expansion nodes.
  const fetchGraphData = useCallback(
    async (iteration, exposureParam, outcomeParam, selectedNodesList = []) => {
      try {
        const requestData = {
          selectedIteration: { id: iteration },
          selectedNodes: selectedNodesList,
        };

        const response = await axios.post(`${API_URL}/api/granularity-query`, requestData);
        const data = response.data;
        if (data.success) {
          const extractedNodes = data.data.flat(Infinity).map((node) => ({
            id: node.identity.low,
            name: node.properties.name,
            isExposure: exposureParam?.type === "predefined" && node.properties.name === exposureParam.value,
            isOutcome: outcomeParam?.type === "predefined" && node.properties.name === outcomeParam.value,
            isLeaf: node.properties.is_leaf_node,
            textLength: node.properties.name.length,
          }));

          let finalNodes = [...extractedNodes];

          // Add custom exposure node if needed.
          if (exposureParam?.type === "custom") {
            const exposureExists = extractedNodes.some((n) => n.name === exposureParam.value);
            if (!exposureExists) {
              finalNodes.push({
                id: `customExposure-${exposureParam.value}`,
                name: exposureParam.value,
                isExposure: true,
                isOutcome: false,
                isLeaf: true,
                textLength: exposureParam.value.length,
              });
            }
          }
          // Add custom outcome node if needed.
          if (outcomeParam?.type === "custom") {
            const outcomeExists = extractedNodes.some((n) => n.name === outcomeParam.value);
            if (!outcomeExists) {
              finalNodes.push({
                id: `customOutcome-${outcomeParam.value}`,
                name: outcomeParam.value,
                isExposure: false,
                isOutcome: true,
                isLeaf: true,
                textLength: outcomeParam.value.length,
              });
            }
          }

          finalNodes.sort((a, b) => a.name.localeCompare(b.name));
          setNodes(finalNodes);

          // (Optional) Adjust view if using transformRef.
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
    },
    []
  );

  // Initial fetch: set iteration and expansion (selectedNodes) parameters.
  const fetchInitialGraphParams = useCallback(
    async (exposureParam, outcomeParam) => {
      try {
        if (exposureParam.type !== "predefined" && outcomeParam.type !== "predefined") {
          await fetchGraphData(0, exposureParam, outcomeParam, []);
          setInitialFetchDone(true);
          return;
        }
        const requestData = { exposure: exposureParam, outcome: outcomeParam };
        const response = await axios.post(`${API_URL}/api/initial-graph-query`, requestData);
        const result = response.data;
        if (result.success) {
          const { iteration, initSelectedNodes } = result.data[0];
          setGranularity(iteration);
          setSliderValue(iteration);
          setSelectedNodes(initSelectedNodes);
          await fetchGraphData(iteration, exposureParam, outcomeParam, initSelectedNodes);
          setInitialFetchDone(true);
        } else {
          console.error("Failed to fetch initial graph data:", result.error);
        }
      } catch (error) {
        console.error("Error fetching initial graph data:", error);
      }
    },
    [fetchGraphData]
  );

  // ----- useEffect: Initial Data Fetching -----
  useEffect(() => {
    fetchInitialGraphParams(exposure, outcome);
  }, [exposure, outcome, fetchInitialGraphParams]);

  // When granularity changes (via the slider), re-fetch graph data, resetting the selected nodes.
  useEffect(() => {
    if (initialFetchDone) {
      // Simply re-fetch the graph data with an empty expansion list.
      fetchGraphData(granularity, exposure, outcome, []);
      // Optionally, also clear the selectedNodes.
      setSelectedNodes([]);
    }
  }, [granularity, exposure, outcome, initialFetchDone, fetchGraphData]);

  useEffect(() => {
    setChosenNodes(computeChosenNodes(nodes, excludedNodes));
  }, [nodes, excludedNodes]);

  useEffect(() => {
    // Preserve previous exclusions for nodes that still exist.
    setExcludedNodes(prev => prev.filter(name => nodes.some(n => n.name === name)));
  }, [nodes]);

  // ----- Fetch Hierarchy for Folder Structure -----
  // Pass allowed nodes (from the current nodes list) to the backend.
  useEffect(() => {
    if (nodes.length > 0) {
      const allowedNodesString = nodes.map(n => n.name).join(",");
      axios
        .get("http://localhost:3001/api/hierarchyQuery", {
          params: { allowedNodes: allowedNodesString }
        })
        .then((response) => {
          if (response.data.success) {
            setHierarchy(sortHierarchy(response.data.hierarchy));
          } else {
            console.error("Failed to fetch hierarchy:", response.data.error);
          }
        })
        .catch((error) => {
          console.error("Error fetching hierarchy:", error);
        });
    }
  }, [nodes]);

  // ----- User Interaction: Toggling Expansion -----
  const handleExpandModified = (nodeName) => {
    let newSelected;
    if (selectedNodes.includes(nodeName)) {
      // If already selected, remove it.
      newSelected = selectedNodes.filter((n) => n !== nodeName);
    } else {
      // Otherwise, add the clicked node.
      newSelected = [...selectedNodes, nodeName];
    }
    setSelectedNodes(newSelected);
    fetchGraphData(granularity, exposure, outcome, newSelected);
  };

  const handleNodeClick = (nodeName) => {
    if (excludedNodes.includes(nodeName)) {
      // Node was unselected, so remove it from excludedNodes.
      setExcludedNodes(prev => prev.filter(n => n !== nodeName));
    } else {
      // Otherwise, add it to the list.
      setExcludedNodes(prev => [...prev, nodeName]);
    }
  };

  // Undo: remove the last expansion.
  const handleUndo = () => {
    if (selectedNodes.length === 0) return;
    const newSelected = selectedNodes.slice(0, -1);
    setSelectedNodes(newSelected);
    fetchGraphData(granularity, exposure, outcome, newSelected);
  };

  // Reset: clear all expansion parameters.
  const handleReset = () => {
    setSelectedNodes([]);
    setGranularity(0);
    setSliderValue(0);
    fetchGraphData(0, exposure, outcome, []);
  };

  // Navigate to the next page (timepoints) with the current state.
  const handleTimepoint = () => {
    if (nodes.length === 0) {
      alert("No nodes available to process!");
      return;
    }
    const filteredNodes = nodes.filter(node => chosenNodes.includes(node.name));
    navigate("/timepoints", {
      state: {
        granularity,
        selectedNodes,
        exposure,
        outcome,
        nodes: filteredNodes,
        resetCache: true,
        chosenNodes,
      },
    });
  };

  // ----- Instructions Modal -----
  const InstructionsModal = () => (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50" style={{ zIndex: 9999 }}>
      <div className="bg-white p-6 rounded-lg max-w-md text-center">
        <h2 className="text-xl font-bold mb-4">Instructions</h2>
        <p className="mb-4 text-sm">
          In the following step you can choose what granularity of concepts you want.
          This is based on the SNOMED-CT hierarchy.
          <br /><br />
          • By default, a granularity level is chosen that tries to include both your exposure and outcome (if specified). If you wish to start from the lowest or a different granularity, please press the reset expansion button or move the granularity slider.
          <br /><br />
          • You can further expand concepts into more specific ones by clicking the plus sign to expand them.
          <br /><br />
          • If there are concepts that you would not like to include, you can deselect them by clicking the name and they will appear greyed out.
          <br /><br />
          Once you have chosen all the concepts, continue to the next step by clicking "Select Timepoints".
        </p>
        <button
          onClick={() => setShowInstructions(false)}
          className="mt-4 bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition"
        >
          Got It
        </button>
      </div>
    </div>
  );

  // ----- Rendering: Recursive Folder Structure Tree -----
  const renderTree = (node, depth = 0) => (
    <motion.div
      key={node.name}
      initial={{ opacity: 0, x: -10 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ duration: 0.2 }}
      style={{ marginLeft: depth * 16 }}
      className="py-1"
    >
      <div className="flex items-center gap-2 py-2 px-3 rounded-md transition-all duration-300 hover:bg-gray-100">
        {!node.isLeaf && (
          <span
            onClick={(e) => {
              e.stopPropagation();
              handleExpandModified(node.name);
            }}
            className="flex items-center cursor-pointer"
          >
            {selectedNodes.includes(node.name) ? (
              <span className="text-lg font-bold text-red-500">-</span>
            ) : (
              nodes.some(n => n.name === node.name) ? (
                <span className="text-lg font-bold text-green-500">+</span>
              ) : null
            )}
          </span>
        )}
        <span
          onClick={(e) => {
            e.stopPropagation();
            handleNodeClick(node.name);
          }}
          className={`cursor-pointer text-md font-medium flex-grow pl-1 ${
            (node.name === exposure.value || node.name === outcome.value)
              ? "text-red-500 font-bold"
              : (selectedNodes.includes(node.name) || !chosenNodes.includes(node.name))
                ? "text-gray-400 opacity-50"
                : "text-black"
          }`}
        >
          {node.name}
        </span>
      </div>
      {/* Always render children if they exist */}
      {node.children && node.children.length > 0 && (
        <motion.div
          initial={{ opacity: 0, y: -5 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.2 }}
          className="border-l border-gray-300 pl-3"
        >
          {node.children.map((child) => renderTree(child, depth + 1))}
        </motion.div>
      )}
    </motion.div>
  );

  // ----- Main Render -----
  return (
    <div className="relative">
      {showInstructions && <InstructionsModal />}
      <div className="flex flex-col items-center p-6 bg-gray-100 w-full" style={{ height: "calc(100vh - 130px)" }}>
        {/* Header */}
        <header className="w-full bg-white p-4 rounded-lg shadow-md sticky top-0 z-50">
          <div className="flex flex-col md:flex-row md:items-center md:justify-between">
            <div className="mb-2 md:mb-0">
              <h1 className="text-base font-semibold text-center">Node Selection</h1>
              <p className="text-sm text-center text-gray-600">
                Exposure:{" "}
                <span className="text-red-500 font-semibold">
                  {exposure.type !== "none" ? exposure.value : "Not set"}
                </span>
                , Outcome:{" "}
                <span className="text-red-500 font-semibold">
                  {outcome.type !== "none" ? outcome.value : "Not set"}
                </span>
              </p>
            </div>
            <div className="flex space-x-2">
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
            <div className="mt-2 md:mt-0 w-full md:w-1/3">
              <label htmlFor="granularity-slider" className="block text-sm font-semibold">
                Granularity Level: {sliderValue}
              </label>
              <input
                id="granularity-slider"
                type="range"
                min="0"
                max="74"
                step="1"
                value={sliderValue}
                onChange={(e) => {
                  const newVal = parseInt(e.target.value, 10);
                  setSliderValue(newVal); // Immediate visual feedback.
                  debouncedSetGranularity(newVal); // Debounced API update.
                }}
                className="w-full"
              />
            </div>
            <button
              onClick={handleTimepoint}
              className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition"
            >
              Select Timepoints
            </button>
          </div>
        </header>
        {/* Folder Structure / Tree View */}
        <div
          className="border rounded-lg bg-white p-4 mt-4 overflow-auto w-full"
          style={{ height: "calc(100vh - 200px)" }}
        >
          {hierarchy.length > 0 ? (
            hierarchy.map((node) => renderTree(node))
          ) : (
            <p className="text-gray-500">Loading hierarchy...</p>
          )}
        </div>
      </div>
    </div>
  );
};

export default GraphPage;
