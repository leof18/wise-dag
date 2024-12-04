import React from 'react';
import logo from '../../assets/logo.png'; // Import the logo

const Tutorial = ({ onFinish }) => {
  return (
    <div style={{ textAlign: 'center', padding: '20px' }}>
      <img src={logo} alt="Wise DAG Logo" style={{ width: '200px', marginBottom: '20px' }} />
      <h1>Welcome to Wise DAG</h1>
      <p>Learn how to build and analyze Directed Acyclic Graphs (DAGs) for your research.</p>
      <ol style={{ textAlign: 'left', margin: '0 auto', maxWidth: '500px' }}>
        <li>Start by uploading or using default exposure-outcome data.</li>
        <li>Customize your graph with granularity and timepoints.</li>
        <li>Resolve conflicts and ensure your DAG is accurate.</li>
        <li>Export your DAG as a code or image for further analysis.</li>
      </ol>
      <button
        onClick={onFinish}
        style={{
          marginTop: '20px',
          padding: '10px 20px',
          backgroundColor: '#4CAF50',
          color: '#fff',
          border: 'none',
          borderRadius: '5px',
          cursor: 'pointer',
        }}
      >
        Get Started
      </button>
    </div>
  );
};

export default Tutorial;
