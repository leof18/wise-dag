import React from 'react';

const UndoRedoControls = ({ onUndo, onRedo, onClear, onConflictResolution }) => {
  return (
    <div style={{ display: 'flex', justifyContent: 'space-around', padding: '10px' }}>
      <button onClick={onUndo}>Undo</button>
      <button onClick={onRedo}>Redo</button>
      <button onClick={onClear}>Clear</button>
      <button onClick={onConflictResolution}>Resolve Conflicts</button>
    </div>
  );
};

export default UndoRedoControls;
