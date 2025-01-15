import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import logo from '../../assets/logo.png';

const ResearchPage = () => {
  const [inputOne, setInputOne] = useState('');
  const [inputTwo, setInputTwo] = useState('');
  const [error, setError] = useState('');
  const navigate = useNavigate();

  const handleNext = () => {
    if (!inputOne || !inputTwo) {
      setError('Both fields are required.');
      return;
    }

    setError(''); // Clear any previous error
    console.log('Research question:', { inputOne, inputTwo });

    // Navigate to the next page with the inputs as state
    navigate('/graph', { state: { term1: inputOne, term2: inputTwo } });
  };

  return (
    <div className="flex items-center justify-center min-h-screen bg-gray-100">
      <div className="w-full max-w-xl bg-white shadow-md rounded-lg p-6">
        <div className="text-center">
          <img
            src={logo}
            alt="Wise-DAG Logo"
            className="mx-auto mb-4 w-16 h-16"
            style={{ width: '100px', height: 'auto' }}
          />
          <h2 className="text-lg font-semibold mb-6">
            Which research question do you want to investigate?
          </h2>
        </div>
        <form onSubmit={(e) => e.preventDefault()} className="space-y-6">
          <div className="flex items-center space-x-2">
            <label className="text-gray-700 font-medium">Does</label>
            <input
              type="text"
              value={inputOne}
              onChange={(e) => setInputOne(e.target.value)}
              placeholder="Enter a term"
              className="flex-grow px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <label className="text-gray-700 font-medium">affect</label>
            <input
              type="text"
              value={inputTwo}
              onChange={(e) => setInputTwo(e.target.value)}
              placeholder="Enter a term"
              className="flex-grow px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <label className="text-gray-700 font-medium">?</label>
          </div>
          {error && <p className="text-red-500 text-sm">{error}</p>}
          <button
            type="button"
            onClick={handleNext}
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
