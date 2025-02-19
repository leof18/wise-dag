import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import DropdownWithSearch from "../DropdownWithSearch";
import logo from "../../assets/logo.png";

const fetchConcepts = async (searchTerm) => {
  try {
    const response = await fetch(
      `http://localhost:3001/api/concepts?searchTerm=${encodeURIComponent(searchTerm)}`
    );
    const data = await response.json();
    if (data.success) {
      return data.data;
    }
    return [];
  } catch (error) {
    console.error("Error fetching concepts:", error);
    return [];
  }
};

const ResearchPage = () => {
  
  const navigate = useNavigate();
  // Each state holds an object with both a value and a type ("none", "predefined", or "custom")
  const [exposure, setExposure] = useState({ value: "", type: "none" });
  const [outcome, setOutcome] = useState({ value: "", type: "none" });

  const handleSubmit = () => {
    const stateData = { exposure, outcome };
    console.log(stateData)
    navigate("/graph", { state: stateData });
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <div className="w-full max-w-xl bg-white shadow-md rounded-lg p-6">
        <div className="text-center">
          <img
            src={logo}
            alt="Wise-DAG Logo"
            className="mx-auto mb-4"
            style={{ width: "100px", height: "auto" }}
          />
          <h2 className="text-lg font-semibold mb-6">
            Which research question do you want to investigate?
          </h2>
        </div>
        <form onSubmit={(e) => e.preventDefault()} className="space-y-6">
          <div className="flex items-center space-x-2">
            <label className="text-gray-700 font-medium">Does</label>
            <DropdownWithSearch
              placeholder="Enter exposure"
              fetchOptions={fetchConcepts}
              // Pass the current value string
              value={exposure.value}
              // onChange receives the full object with both value and type
              onChange={setExposure}
            />
            <label className="text-gray-700 font-medium">affect</label>
            <DropdownWithSearch
              placeholder="Enter outcome"
              fetchOptions={fetchConcepts}
              value={outcome.value}
              onChange={setOutcome}
            />
            <label className="text-gray-700 font-medium">?</label>
          </div>
          <button
            type="button"
            onClick={handleSubmit}
            className="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700"
          >
            Next
          </button>
        </form>
      </div>
    </div>
  );
};

export default ResearchPage;
