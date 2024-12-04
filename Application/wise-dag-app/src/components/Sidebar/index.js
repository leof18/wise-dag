import React from 'react';

const Sidebar = ({ nodes = [], edges = [], onFilterChange }) => {
  const uniqueStrengths = [...new Set(edges.map(edge => edge.strength))]
    .filter(strength => !isNaN(strength))
    .sort((a, b) => a - b);

  const uniqueOutcomes = [...new Set(edges.map(edge => edge.target))];

  const handleStrengthChange = (event) => {
    onFilterChange({ strength: event.target.value, outcome: null });
  };

  const handleOutcomeChange = (event) => {
    onFilterChange({ strength: null, outcome: event.target.value });
  };

  return (
    <div style={{ width: '250px', padding: '10px', backgroundColor: '#f4f4f4', borderRight: '1px solid #ddd' }}>
      <h3>Filters</h3>
      <label>Filter by Strength:</label>
      <select onChange={handleStrengthChange} style={{ width: '100%', marginBottom: '10px' }}>
        <option value="">All</option>
        {uniqueStrengths.map(strength => (
          <option key={strength} value={strength}>
            {strength}
          </option>
        ))}
      </select>
      <label>Filter by Outcome:</label>
      <select onChange={handleOutcomeChange} style={{ width: '100%' }}>
        <option value="">All</option>
        {uniqueOutcomes.map(outcome => (
          <option key={outcome} value={outcome}>
            {outcome}
          </option>
        ))}
      </select>
    </div>
  );
};

export default Sidebar;
