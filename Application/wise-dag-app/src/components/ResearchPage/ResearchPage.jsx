import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import DropdownWithSearch from "../DropdownWithSearch/DropdownWithSearch";
import logo from "../../assets/logo.png";

const ResearchPage = () => {
  const [exposure, setExposure] = useState(""); // Selected exposure
  const [outcome, setOutcome] = useState(""); // Selected outcome
  const [error, setError] = useState(""); // Error handling
  const navigate = useNavigate();

  const handleSubmit = () => {
    if (!exposure || !outcome) {
      setError("Please provide both an exposure and an outcome.");
      return;
    }
    navigate("/graph", { state: { exposure, outcome } });
  };

  const fetchOptions = async (searchTerm) => {
    try {
      const response = await fetch(
        `/api/concepts?searchTerm=${encodeURIComponent(searchTerm)}`
      );
      if (!response.ok) {
        throw new Error("Failed to fetch options");
      }
      const data = await response.json();
      return data.map((item) => item.ConceptName); // Return concept names
    } catch (error) {
      console.error("Error fetching options:", error);
      return [];
    }
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
        {error && <div className="text-red-500 text-sm mb-4">{error}</div>}
        <form onSubmit={(e) => e.preventDefault()} className="space-y-6">
          <div className="flex items-center space-x-2">
            <label className="text-gray-700 font-medium">Does</label>
            <DropdownWithSearch
              placeholder="Select exposure"
              fetchOptions={fetchOptions}
              value={exposure}
              onChange={setExposure}
            />
            <label className="text-gray-700 font-medium">affect</label>
            <DropdownWithSearch
              placeholder="Select outcome"
              fetchOptions={fetchOptions}
              value={outcome}
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
