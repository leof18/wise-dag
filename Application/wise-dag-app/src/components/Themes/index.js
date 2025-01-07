import React from 'react';

const ExportPanel = ({ dagCode }) => {
  const handleCopy = () => navigator.clipboard.writeText(dagCode);

  return (
    <div className="export-panel">
      <h3>DAG Code</h3>
      <textarea value={dagCode} readOnly rows={10} cols={30} />
      <button onClick={handleCopy}>Copy to Clipboard</button>
    </div>
  );
};

export default ExportPanel;
