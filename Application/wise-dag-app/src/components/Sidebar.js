// Sidebar.js

import React from 'react';

const Sidebar = ({ nodes, edges, onFilterChange, dagCode }) => {
  const uniqueOutcomes = [...new Set(edges.map(edge => edge.target))];
  const uniqueStrengths = [...new Set(edges.map(edge => edge.strength))].filter(s => !isNaN(s)).sort((a, b) => a - b);

  const handleStrengthChange = (e) => {
    onFilterChange({ strength: e.target.value, outcome: '' });
  };

  const handleOutcomeChange = (e) => {
    onFilterChange({ strength: '', outcome: e.target.value });
  };

  return (
    <div style={{ width: '250px', padding: '10px', backgroundColor: '#f4f4f4' }}>
      <h3>Filters</h3>
      <label>Select Strength:</label>
      <select onChange={handleStrengthChange} style={{ width: '100%', marginBottom: '10px' }}>
        <option value="">All</option>
        {uniqueStrengths.map((strength) => (
          <option key={strength} value={strength}>
            {strength}
          </option>
        ))}
      </select>
      <label>Select Outcome:</label>
      <select onChange={handleOutcomeChange} style={{ width: '100%', marginBottom: '10px' }}>
        <option value="">All</option>
        {uniqueOutcomes.map((outcome) => (
          <option key={outcome} value={outcome}>
            {outcome}
          </option>
        ))}
      </select>

      <hr />
      <h3>Model Code</h3>
      <textarea value={dagCode} readOnly rows={8} style={{ width: '100%' }} />
      <button onClick={() => navigator.clipboard.writeText(dagCode)}>Copy to Clipboard</button>
    </div>
  );
};

export default Sidebar;
