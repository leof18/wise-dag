import { useNavigate, useLocation } from "react-router-dom";
import React, { useState, useEffect } from "react";
import axios from "axios";

// Use the environment variable or default to Render backend URL
const API_URL = process.env.Web_API_URL || "https://wise-r.onrender.com";

const TimepointPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { granularity, selectedNodes, exposure, outcome, nodes, resetCache: initialResetCache } = location.state || {};
  const [shouldResetCache, setShouldResetCache] = useState(initialResetCache || false);

  const [currentStep, setCurrentStep] = useState(1);
  
  const [timepointsInput, setTimepointsInput] = useState("");
  const [timepoints, setTimepoints] = useState(null);
  const [nodeOrder, setNodeOrder] = useState([]);
  const [rOutput, setROutput] = useState(null);
  const [nodesToResolve, setNodesToResolve] = useState([]);
  const [showAllNodes, setShowAllNodes] = useState(false); // Toggle state

  const handleInputChange = (e) => {
    setTimepointsInput(e.target.value);
  };

  const handleConfirmTimepoints = () => {
    const numTimepoints = parseInt(timepointsInput, 10);
  
    if (isNaN(numTimepoints) || numTimepoints <= 0) {
      alert("Please enter a valid number greater than 0.");
      return;
    }
  
    // ✅ Ensure `nodes` is defined before using `map()`
    if (!nodes || nodes.length === 0) {
      console.error("❌ Error: nodes is undefined or empty.");
      alert("Nodes data is missing. Please reload the page.");
      return;
    }
  
    setTimepoints(numTimepoints);
  
    const initializedData = nodes.map((node) => ({
      ...node,
      isFixed: false,
<<<<<<< HEAD:Application/wise-dag-app/src/components/TimepointPage/index.jsx
      order: { name: node.name, value: node.order?.value ?? 0 },
      observation: "unobserved",
=======
      order: { name: node.name, value: Number(node.order?.value) || 0 },
      observation: "unobserved", // default unobserved
>>>>>>> upstream/main:Application/wise-dag-app/src/pages/TimepointPage/index.jsx
    }));
  
    setNodeOrder(initializedData);
    setCurrentStep(2); // ✅ Ensure this state change happens safely
  };

  const handleToggleConstant = (nodeName) => {
    setNodeOrder((prevData) =>
      prevData.map((node) =>
        node.name === nodeName ? { ...node, isFixed: !node.isFixed } : node
      )
    );
  };

  const handleObservationChange = (nodeName, newValue) => {
    setNodeOrder((prevData) =>
      prevData.map((node) =>
        node.name === nodeName ? { ...node, observation: newValue } : node
      )
    );
  };

  const handleConfirmNodeSettings = () => {
    setCurrentStep(3);
  };
  
  // Fetch cycles using API
  useEffect(() => {
    if (nodeOrder && nodeOrder.length > 0) {
      const orderPayload = nodeOrder.reduce((acc, node) => {
        acc[node.name] = node.order.value;
        return acc;
      }, {});

      const nodeSettingsPayload = nodeOrder.reduce((acc, node) => {
        acc[node.name] = {
          isFixed: node.isFixed,
          observation: 
            node.name === exposure.value
              ? ""
              : node.name === outcome.value
                ? ""
                : node.observation,
        };
        return acc;
      }, {});

      const requestCycles = {
        granularity,
        selectedNodes,
        exposure,
        outcome,
        timepoints,
        nodeOrder: orderPayload,
        nodeSettings: nodeSettingsPayload,
        resetCache: shouldResetCache
      };
      
      const fetchCycles = async () => {
        try {
          const response = await axios.post(`${API_URL}/api/cycles`, requestCycles);
          const data = response.data;
          setROutput(data.rOutput);
          setShouldResetCache(false);
        } catch (error) {
          console.error("Error fetching cycles:", error);
        }
      };
      fetchCycles();
      
    }
  }, [timepoints, nodeOrder, granularity, selectedNodes, exposure, outcome]);

  // Parse rOutput to update nodesToResolve list
  useEffect(() => {
    if (rOutput) {
      const newNodes = rOutput
        .split("->")
        .map((nodeStr) => nodeStr.trim())
        .filter((nodeStr) => nodeStr.length > 0);
      const uniqueNodes = Array.from(new Set(newNodes));
      setNodesToResolve((prevNodes) => {
        const combined = new Set([...prevNodes, ...uniqueNodes]);
        return Array.from(combined);
      });
    }
  }, [rOutput]);
  
  const handleNodeOrderValueChange = (nodeName, value) => {
    const numericValue = parseInt(value, 10);
    setNodeOrder((prevData) =>
      prevData.map((node) =>
        node.name === nodeName
          ? { ...node, order: { ...node.order, value: numericValue } }
          : node
      )
    );
  };

  const handleNext = async () => {
    try {
      const response = await fetch(`${API_URL}/api/dagitty-input`);
      const data = await response.json();
      if (data.dagittyText) {
        localStorage.setItem("dagittyText", data.dagittyText);
        navigate("/dagitty");
      }
    } catch (error) {
      console.error("Error fetching updated DAGitty input:", error);
    }
  };

  const nodesToDisplay = showAllNodes
    ? nodeOrder
    : nodesToResolve.length
      ? nodeOrder.filter((node) => nodesToResolve.includes(node.name))
      : [];

  const handleToggleNodes = () => {
    setShowAllNodes((prev) => !prev);
  };

  return (
    <div className="flex flex-col items-center bg-gray-100 w-full" style={{ height: "calc(100vh - 130px)" }}>
      <header className="w-full flex justify-center items-center bg-white p-4 rounded-lg shadow-md mb-4 sticky top-0 z-50">
        <h1 className="text-2xl font-bold">Set Timepoints And Order</h1>
      </header>

      {currentStep === 1 && (
        <div className="flex flex-col items-center">
          <label className="text-lg font-semibold">How many timepoints do you need?</label>
          <input
            type="number"
            min="1"
            max="10"
            value={timepointsInput}
            onChange={handleInputChange}
            className="w-full border p-2 rounded mt-2"
          />
          <button
            onClick={handleConfirmTimepoints}
            className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition mt-3"
          >
            Confirm
          </button>
        </div>
      )}

      {currentStep === 3 && rOutput && (
        <div className="w-full max-w-3xl bg-white p-4 rounded-lg shadow-md mb-4">
          <h2 className="text-xl font-semibold">Cycle to solve:</h2>
          <pre>{rOutput}</pre>
        </div>
      )}

      {currentStep === 3 && (
        <>
          <div className="w-full max-w-3xl mb-4">
            <button
              onClick={handleToggleNodes}
              className="bg-green-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-green-600 transition"
            >
              {showAllNodes ? "Show Relevant Nodes" : "Show All Nodes"}
            </button>
          </div>
          <button
            onClick={handleNext}
            className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition w-full mt-4"
          >
            Proceed to DAGify
          </button>
        </>
      )}
    </div>
  );
};

export default TimepointPage;

