import { useNavigate, useLocation } from "react-router-dom";
import React, { useState, useEffect } from "react";
import axios from "axios";

const TimepointPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { granularity, selectedNodes, exposure, outcome, nodes} = location.state || {};

  const [timepointsInput, setTimepointsInput] = useState(""); // User enters value here
  const [timepoints, setTimepoints] = useState(null); // Gets set when confirmed
  const [nodeOrder, setNodeOrder] = useState([]);
  const [rOutput, setROutput] = useState(null);
  const [nodesToResolve, setNodesToResolve] = useState([]);

  const handleInputChange = (e) => {
    setTimepointsInput(e.target.value);
  };

  const handleConfirmTimepoints = () => {
    const numTimepoints = parseInt(timepointsInput, 10);
    if (isNaN(numTimepoints) || numTimepoints <= 0) {
      alert("Please enter a valid number greater than 0.");
      return;
    }
    setTimepoints(numTimepoints);
  };

  // Generate ordered nodes starting with all at 0
  useEffect(() => {
    if (timepoints !== null && nodes && nodes.length > 0) {
      const initializedData = nodes.map((node) => ({
        ...node,
        isFixed: false,
        order: {name: node.name, value: node.order?.value ?? 0}
      }));
      setNodeOrder(initializedData);
    }
  }, [timepoints, nodes]);

  // Once the number of timepoints is confirmed, call the API to check for cycles
  useEffect(() => {
    if (nodeOrder && nodeOrder.length > 0) {
      
      // Convert the nodeOrder array into the expected object format
      const orderPayload = nodeOrder.reduce((acc, node) => {
        acc[node.order.name] = node.order.value;
        return acc;
      }, {});
      
      const requestCycles = {
        granularity,
        selectedNodes,
        exposure,
        outcome,
        timepoints,
        nodeOrder: orderPayload,
      };

      // fetchCycles send a request to retireve whether there are cycles in the DAG or not. If yes it returns one of the cycles to be solved. 
      // This should be run iteratively until all cycles are solved.
      const fetchCycles = async () => {
        try {
          const response = await axios.post(
            "http://localhost:3001/api/cycles",
            requestCycles
          );
          const data = response.data;
          setROutput(data.rOutput);
        } catch (error) {
          console.error("Error fetching cycles:", error);
        }
      };
      fetchCycles();
    }
  }, [timepoints, nodeOrder, granularity, selectedNodes, exposure, outcome]);

  // Whenever rOutput changes, parse it to extract node names.
  useEffect(() => {
    if (rOutput) {
      // Split by "->", trim extra whitespace, and filter out any empty strings.
      const newNodes = rOutput
        .split("->")
        .map((nodeStr) => nodeStr.trim())
        .filter((nodeStr) => nodeStr.length > 0);

      // Remove duplicates.
      const uniqueNodes = Array.from(new Set(newNodes));

      // Update nodesToResolve by combining any previous nodes with the new ones.
      setNodesToResolve((prevNodes) => {
        const combined = new Set([...prevNodes, ...uniqueNodes]);
        return Array.from(combined);
      });
    }
  }, [rOutput]);

  const handleFixedNodeToggle = (nodeName) => {
    setNodeOrder((prevData) =>
      prevData.map((node) =>
        node.name === nodeName ? { ...node, isFixed: !node.isFixed } : node
      )
    );
  };

  const handleNodeOrderValueChange = (nodeName, value) => {
    setNodeOrder((prevData) =>
      prevData.map((node) =>
        node.name === nodeName
          ? { ...node, order: { ...node.order, value }}
          : node
      )
    );
  };

  const handleNext = async () => {
    try {
      const response = await fetch("http://localhost:3001/api/dagitty-input"); // Fetch updated file
      const data = await response.json();
  
      if (data.dagittyText) {
        localStorage.setItem("dagittyText", data.dagittyText); // Store updated DAGitty input
        navigate("/dagitty"); // Navigate to DAGittyPage
      }
    } catch (error) {
      console.error("Error fetching updated DAGitty input:", error);
    }
  };
  

  // Only include nodes whose names are in nodesToResolve.
  const nodesToDisplay = nodesToResolve.length
    ? nodeOrder.filter((node) => nodesToResolve.includes(node.name))
    : [];

  return (
    <div
      className="flex flex-col items-center bg-gray-100 w-full"
      style={{ height: "calc(100vh - 130px)" }}
    >
      {/* Fixed Header (Same as GraphPage) */}
      <header className="w-full flex justify-center items-center bg-white p-4 rounded-lg shadow-md mb-4 sticky top-0 z-50">
        <h1 className="text-2xl font-bold">Set Timepoints And Order</h1>
      </header>

        {/* Display of the R Output */}
        {rOutput && (
        <div className="w-full max-w-3xl bg-white p-4 rounded-lg shadow-md mb-4">
          <h2 className="text-xl font-semibold">Cycle to solve:</h2>
          <pre>{rOutput}</pre>
        </div>
      )}

      {/* Scrollable Content */}
      <div
        className="w-full max-w-3xl bg-white p-6 rounded-lg shadow-md overflow-auto"
        style={{ maxHeight: "80vh" }}
      >
        {/* Ask for number of timepoints */}
        {timepoints === null ? (
          <div className="flex flex-col items-center">
            <label className="text-lg font-semibold">
              How many timepoints do you need?
            </label>
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
        ) : (
          <>
            <p className="text-md text-gray-700 mb-4">
              {/* You have chosen <strong>{timepoints}</strong> timepoints. */}
            </p>

            {/* Only show nodes that are in the nodesToResolve list */}
            {nodesToDisplay.length > 0 ? (
              nodesToDisplay.map((node) => (
                <div
                  key={node.id || node.name}
                  className="border p-3 rounded-md mb-4 bg-gray-50"
                >
                  <h2 className="text-lg font-semibold">{node.name}</h2>
                  <label className="text-sm flex items-center">
                    <input
                      type="checkbox"
                      checked={node.isFixed}
                      onChange={() => handleFixedNodeToggle(node.name)}
                      className="mr-2"
                    />
                    This node has no order in time
                  </label>

                  {!node.isFixed && (
                    <div className="mt-2 grid grid-cols-3 gap-2">
                      <input
                        type="text"
                        value="Measurement order"
                        disabled
                        className="text-center font-semibold border rounded p-1"
                      />
                      <input
                        type="number"
                        value={node.order.value}
                        onChange={(e) =>
                          handleNodeOrderValueChange(node.name, e.target.value)
                        }
                        className="border rounded p-1 text-center w-full"
                      />
                    </div>
                  )}
                </div>
              ))
            ) : (
              <p className="text-gray-600">
                {rOutput
                  ? "No nodes to resolve. All cycles might have been fixed!"
                  : "Waiting for cycle detection..."}
              </p>
            )}

            <button
              onClick={handleNext}
              className="bg-blue-500 text-white px-4 py-2 rounded-lg shadow-md hover:bg-blue-600 transition w-full mt-4"
            >
              Proceed to DAGify
            </button>
          </>
        )}
      </div>
    </div>
  );
};

export default TimepointPage;
