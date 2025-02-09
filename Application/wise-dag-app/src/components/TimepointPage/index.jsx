import { useNavigate, useLocation } from "react-router-dom";
import React, { useState } from "react";

const TimepointPage = () => {
  const location = useLocation();
  const navigate = useNavigate();
  const { selectedNodes } = location.state || { selectedNodes: [] };

  const [timepointsInput, setTimepointsInput] = useState(""); // User enters value here
  const [timepoints, setTimepoints] = useState(null); // Gets set when confirmed
  const [timepointData, setTimepointData] = useState([]);

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

    // Generate timepointed nodes
    if (selectedNodes.length > 0) {
      const initializedData = selectedNodes.map((node) => ({
        ...node,
        isFixed: false,
        timepoints: Array.from({ length: numTimepoints }, (_, i) => ({
          name: `${node.name}_T${i + 1}`,
          value: 0,
        })),
      }));
      setTimepointData(initializedData);
    }
  };

  const handleFixedNodeToggle = (nodeName) => {
    setTimepointData((prevData) =>
      prevData.map((node) =>
        node.name === nodeName ? { ...node, isFixed: !node.isFixed } : node
      )
    );
  };

  const handleTimepointValueChange = (nodeName, index, value) => {
    setTimepointData((prevData) =>
      prevData.map((node) =>
        node.name === nodeName
          ? {
              ...node,
              timepoints: node.timepoints.map((tp, i) =>
                i === index ? { ...tp, value } : tp
              ),
            }
          : node
      )
    );
  };

  const handleNext = () => {
    navigate("/dagitty", { state: { timepointData } });
  };

  return (
    <div className="flex flex-col items-center bg-gray-100 w-full"
      style={{ height: "calc(100vh - 130px)" }}>
      
      {/* Fixed Header (Same as GraphPage) */}
      <header className="w-full flex justify-center items-center bg-white p-4 rounded-lg shadow-md mb-4 sticky top-0 z-50">
        <h1 className="text-2xl font-bold">Set Timepoints</h1>
      </header>

      {/* Scrollable Content */}
      <div className="w-full max-w-3xl bg-white p-6 rounded-lg shadow-md overflow-auto"
        style={{ maxHeight: "80vh" }}>
        
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
              You have chosen <strong>{timepoints}</strong> timepoints.
            </p>

            {timepointData.map((node) => (
              <div
                key={node.id}
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
                  Keep this node constant (No timepoints)
                </label>

                {!node.isFixed && (
                  <div className="mt-2 grid grid-cols-3 gap-2">
                    {node.timepoints.map((tp, index) => (
                      <div key={index} className="flex flex-col items-center">
                        <input
                          type="text"
                          value={tp.name}
                          disabled
                          className="text-center font-semibold border rounded p-1"
                        />
                        <input
                          type="number"
                          value={tp.value}
                          onChange={(e) =>
                            handleTimepointValueChange(
                              node.name,
                              index,
                              e.target.value
                            )
                          }
                          className="border rounded p-1 text-center w-full"
                        />
                      </div>
                    ))}
                  </div>
                )}
              </div>
            ))}

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
