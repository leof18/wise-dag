import React from 'react';

const Sidebar = ({ nodes, edges }) => {
  return (
    <div style={{ width: '250px', padding: '10px', backgroundColor: '#f4f4f4' }}>
      <h3>Summary</h3>
      <p>Treatment: A</p>
      <p>Outcome: Y</p>
      <p>Adjusted: N/A</p>
      <button>Show More Details</button>
      <hr />
      <h3>Editor</h3>
      <button>Graphical</button>
      <button>Structural</button>
      {/* Add more options for adding/removing nodes */}
    </div>
  );
};

export default Sidebar;
