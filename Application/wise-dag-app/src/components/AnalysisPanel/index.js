import React from 'react';

const AnalysisPanel = ({ dagCode }) => {
  const handleCopy = () => navigator.clipboard.writeText(dagCode);

  return (
    <div style={{ padding: '10px', backgroundColor: '#f9f9f9', marginTop: '10px' }}>
      <h3>Model Code</h3>
      <textarea value={dagCode} readOnly rows={8} style={{ width: '100%' }} />
      <button onClick={handleCopy}>Copy to Clipboard</button>
    </div>
  );
};

export default AnalysisPanel;
