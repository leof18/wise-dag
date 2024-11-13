import React, { useState, useEffect } from 'react';
import Sidebar from './components/Sidebar';
import DagViewer from './components/DagViewer';
import { generateDagCode } from './utils/dagCodeGenerator';

function App() {
  const [nodes, setNodes] = useState([]);
  const [edges, setEdges] = useState([]);
  const [filteredEdges, setFilteredEdges] = useState(edges);

  useEffect(() => {
    // Fetch data from the backend
    fetch('http://localhost:3001/api/data')
      .then((response) => response.json())
      .then((data) => {
        const nodes = [];
        const edges = [];

        data.forEach(row => {
          const exposure = row.Exposure;
          const outcome = row.Outcome;
          const direction = row.Direction;
          const strength = parseFloat(row.Strength);

          if (!nodes.some(node => node.id === exposure)) {
            nodes.push({ id: exposure, label: exposure });
          }
          if (!nodes.some(node => node.id === outcome)) {
            nodes.push({ id: outcome, label: outcome });
          }
          edges.push({ source: exposure, target: outcome, direction, strength });
        });

        setNodes(nodes);
        setEdges(edges);
        setFilteredEdges(edges); // Initialize filteredEdges to all edges initially
      })
      .catch((error) => console.error('Error fetching data:', error));
  }, []);

  const handleFilterChange = ({ strength, outcome }) => {
    let newFilteredEdges = edges;

    if (strength) {
      newFilteredEdges = newFilteredEdges.filter(edge => edge.strength === parseFloat(strength));
    }

    if (outcome) {
      newFilteredEdges = newFilteredEdges.filter(edge => edge.source === outcome || edge.target === outcome);
    }

    setFilteredEdges(newFilteredEdges);
  };

  return (
    <div className="App" style={{ display: 'flex' }}>
      <Sidebar nodes={nodes} edges={edges} onFilterChange={handleFilterChange} dagCode={generateDagCode(nodes, filteredEdges)} />
      <div style={{ flex: 1 }}>
        <DagViewer nodes={nodes} edges={filteredEdges} onSelectNode={() => {}} />
      </div>
    </div>
  );
}

export default App;
