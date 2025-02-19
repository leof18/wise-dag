import React, { useState } from 'react';

const EditPanel = ({ selectedNode, onSave }) => {
  const [label, setLabel] = useState(selectedNode.label);

  const handleSave = () => {
    onSave({ ...selectedNode, label });
  };

  return (
    <div className="edit-panel">
      <h3>Edit Node</h3>
      <input
        type="text"
        value={label}
        onChange={(e) => setLabel(e.target.value)}
        placeholder="Node Label"
      />
      <button onClick={handleSave}>Save</button>
    </div>
  );
};

export default EditPanel;
