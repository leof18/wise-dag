import React from 'react';

const GranularitySlider = ({ value, onChange }) => {
  return (
    <div style={{ padding: '10px', backgroundColor: '#f9f9f9' }}>
      <h4>Select Granularity</h4>
      <input
        type="range"
        min="1"
        max="26"
        value={value}
        onChange={(e) => onChange(parseInt(e.target.value, 10))}
      />
      <span>Granularity: {value}</span>
    </div>
  );
};

export default GranularitySlider;
