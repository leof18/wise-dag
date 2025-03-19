import { useNavigate, useLocation } from "react-router-dom";
import React, { useState, useEffect, useCallback } from "react";
import axios from "axios";
import { motion } from "framer-motion";
import "tailwindcss/tailwind.css";

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

// External helper function to recursively find a path to a node with the given target name.
function findPath(node, target) {
  if (node.name === target) return [node.name];
  if (node.children && node.children.length > 0) {
    for (const child of node.children) {
      const childPath = findPath(child, target);
      if (childPath) return [node.name, ...childPath];
    }
  }
  return null;
}

const GraphPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { exposure = { value: "", type: "none" }, outcome = { value: "", type: "none" } } = location.state || {};

  // Folder structure state for UI rendering.
  const [hierarchy, setHierarchy] = useState([]);
  const [expandedNodes, setExpandedNodes] = useState(new Set());

  // Background state to support original functionalities.
  const [nodes, setNodes] = useState([]);
  const [granularity, setGranularity] = useState(0);
  const [selectedNodes, setSelectedNodes] = useState([]);
  const [initialFetchDone, setInitialFetchDone] = useState(false);

  // Prevent auto-expansion from re-triggering unnecessarily.
  const [autoExpanded, setAutoExpanded] = useState(false);

  // ---------- Original Background Functions ----------
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
        } else {
          console.error("Failed to fetch graph data:", data.error);
        }
      } catch (error) {
        console.error("Error fetching graph data:", error);
      }
    },
    []
  );

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

  useEffect(() => {
    fetchInitialGraphParams(exposure, outcome);
  }, [exposure, outcome, fetchInitialGraphParams]);

  useEffect(() => {
    if (initialFetchDone) {
      fetchGraphData(granularity, exposure, outcome, selectedNodes);
    }
  }, [granularity, selectedNodes, exposure, outcome, initialFetchDone, fetchGraphData]);

  // ---------- Folder Structure Code (UI) ----------
  // Fetch hierarchy and sort it alphabetically using the external sortHierarchy function.
  useEffect(() => {
    axios.get(`${API_URL}/api/hierarchyQuery`)
      .then(response => {
        if (response.data.success) {
          setHierarchy(sortHierarchy(response.data.hierarchy));
        } else {
          console.error("Failed to fetch hierarchy:", response.data.error);
        }
      })
      .catch(error => {
        console.error("Error fetching hierarchy:", error);
      });
  }, []);

  // Auto-expand paths leading to exposure and outcome nodes.
  useEffect(() => {
    if (!autoExpanded && hierarchy.length > 0) {
      const newExpanded = new Set(expandedNodes);
      const targets = [];
      if (exposure.type !== "none" && exposure.value) targets.push(exposure.value);
      if (outcome.type !== "none" && outcome.value) targets.push(outcome.value);

      targets.forEach(target => {
        hierarchy.forEach(root => {
          const path = findPath(root, target);
          if (path) {
            path.forEach((nodeName) => newExpanded.add(nodeName));
          }
        });
      });
      setExpandedNodes(newExpanded);
      setAutoExpanded(true);
    }
  }, [hierarchy, exposure, outcome, autoExpanded, expandedNodes]);

  // New function: when expanding a node, toggle expansion and add that node to selectedNodes.
  const handleExpandModified = (nodeName) => {
    // Toggle expansion.
    setExpandedNodes((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(nodeName)) {
        newSet.delete(nodeName);
      } else {
        newSet.add(nodeName);
      }
      return newSet;
    });
    // Add to selectedNodes if not already present.
    setSelectedNodes((prev) => {
      if (prev.includes(nodeName)) return prev;
      return [...prev, nodeName];
    });
  };

  // (Remove the old handleNodeClick function since clicking the row no longer selects.)

  // Undo and Reset controls.
  const handleUndo = () => {
    if (selectedNodes.length === 0) return;
    setSelectedNodes(selectedNodes.slice(0, -1));
  };

  const handleReset = () => {
    setSelectedNodes([]);
    setExpandedNodes(new Set());
    setAutoExpanded(false);
  };

  // Navigate to the timepoints page.
  const handleTimepoint = () => {
    if (hierarchy.length === 0) {
      alert("No hierarchy available to process!");
      return;
    }
    navigate("/timepoints", {
      state: {
        granularity,
        selectedNodes,
        exposure,
        outcome,
        nodes,
        hierarchy,
        resetCache: true,
      },
    });
  };

  // Recursive function to render the tree.
  const renderTree = (node, depth = 0) => (
    <motion.div
      key={node.name}
      initial={{ opacity: 0, x: -10 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ duration: 0.2 }}
      style={{ marginLeft: depth * 16 }}
      className="py-1"
    >
      <div className="flex items-center gap-2 cursor-pointer py-2 px-3 rounded-md transition-all duration-300 hover:bg-gray-100">
        {node.children && node.children.length > 0 && (
          <span
            onClick={(e) => {
              e.stopPropagation();
              handleExpandModified(node.name);
            }}
            className="flex items-center"
          >
            {expandedNodes.has(node.name) ? (
              <span className="text-lg font-bold text-red-500">−</span>
            ) : (
              <span className="text-lg font-bold text-green-500">+</span>
            )}
          </span>
        )}
        <span className="text-md font-medium">{node.name}</span>
      </div>
      {node.children && node.children.length > 0 && expandedNodes.has(node.name) && (
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

  return (
    <div className="flex flex-col items-center p-6 bg-gray-100 w-full" style={{ height: "calc(100vh - 130px)" }}>
      {/* Header */}
      <header className="w-full bg-white p-4 rounded-lg shadow-md sticky top-0 z-50">
        <div className="flex flex-col md:flex-row md:items-center md:justify-between">
          <div className="mb-2 md:mb-0">
            <h1 className="text-base font-semibold text-center">Node Selection</h1>
            <p className="text-sm text-center text-gray-600">
              Exposure: <span className="text-red-500 font-semibold">{exposure.type !== "none" ? exposure.value : "Not set"}</span>, Outcome: <span className="text-red-500 font-semibold">{outcome.type !== "none" ? outcome.value : "Not set"}</span>
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
          <button
              onClick={handleTimepoint}
              className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition"
            >
              Select Timepoints 
            </button>
        </div>
      </header>
      {/* Folder Structure / Tree View */}
      <div className="border rounded-lg bg-white p-4 mt-4 overflow-auto w-full" style={{ height: "calc(100vh - 200px)" }}>
        {hierarchy.length > 0 ? (
          hierarchy.map((node) => renderTree(node))
        ) : (
          <p className="text-gray-500">Loading hierarchy...</p>
        )}
      </div>
    </div>
  );
};

export default GraphPage;
