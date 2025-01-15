import React, { useState } from "react";

const Node = ({ id, label, type, onEdit }) => {
  const [isEditing, setIsEditing] = useState(false);
  const [newLabel, setNewLabel] = useState(label);

  const handleEdit = () => {
    setIsEditing(true);
  };

  const handleSave = () => {
    onEdit(id, newLabel);
    setIsEditing(false);
  };

  return (
    <div
      className={`graph-node ${
        type === "input"
          ? "node-input"
          : type === "output"
          ? "node-output"
          : "node-intermediate"
      }`}
    >
      {isEditing ? (
        <input
          type="text"
          value={newLabel}
          onChange={(e) => setNewLabel(e.target.value)}
          onBlur={handleSave}
          className="w-full px-2 py-1 rounded"
        />
      ) : (
        <span onDoubleClick={handleEdit}>{label}</span>
      )}
    </div>
  );
};

export default Node;
