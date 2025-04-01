import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import DropdownWithSearch from "../../components/Searchlist";
import logo from "../../assets/logo.png";

const API_URL =
  process.env.NODE_ENV === "development"
    ? "http://localhost:3001"
    : process.env.REACT_APP_WEB_API_URL;

console.log("API_URL:", API_URL);

const fetchConcepts = async (searchTerm) => {
  try {
    const response = await fetch(
      `${API_URL}/api/concepts?searchTerm=${encodeURIComponent(searchTerm)}`
    );
    const data = await response.json();
    return data.success ? data.data : [];
  } catch (error) {
    console.error("Error fetching concepts:", error);
    return [];
  }
};

const ResearchPage = () => {
  const navigate = useNavigate();
  const [exposure, setExposure] = useState({ value: "", type: "none" });
  const [outcome, setOutcome] = useState({ value: "", type: "none" });
  const [isTooltipVisible, setIsTooltipVisible] = useState(false);

  const handleSubmit = () => {
    const stateData = { exposure, outcome };
    console.log(stateData);
    navigate("/graph", { state: stateData });
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <div className="relative w-full max-w-xl bg-white shadow-md rounded-lg p-6">
        {/* Help Button */}
        <div
          className="absolute top-2 right-2"
          onMouseEnter={() => setIsTooltipVisible(true)}
          onMouseLeave={() => setIsTooltipVisible(false)}
        >
          <button
            className="text-blue-500 hover:text-blue-700 text-lg font-bold bg-white border border-blue-300 rounded-full w-7 h-7 flex items-center justify-center shadow"
            title="Help"
          >
            ?
          </button>
          {isTooltipVisible && (
            <div className="absolute top-9 right-0 w-64 bg-white border border-blue-300 rounded-md shadow-lg text-sm text-gray-700 p-3 z-20">
              <strong>Need help?</strong><br />
              Type and select an exposure and an outcome variable from the dropdown list to frame your research question.
            </div>
          )}
        </div>

        {/* Main Content */}
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
              value={exposure.value}
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

