import React, { useState } from "react";

const Node = ({ id, label, type, x, y, onEdit }) => {
  const [isEditing, setIsEditing] = useState(false);
  const [newLabel, setNewLabel] = useState(label);

  const handleDoubleClick = () => setIsEditing(true);
  const handleBlur = () => {
    setIsEditing(false);
    onEdit(id, newLabel);
  };

  return (
    <div
      className={`node node-${type}`}
      onDoubleClick={handleDoubleClick}
      style={{
        position: "absolute",
        left: `${x}px`,
        top: `${y}px`,
      }}
    >
      {isEditing ? (
        <input
          type="text"
          value={newLabel}
          onChange={(e) => setNewLabel(e.target.value)}
          onBlur={handleBlur}
          autoFocus
        />
      ) : (
        <span>{label}</span>
      )}
    </div>
  );
};

export default Node;
