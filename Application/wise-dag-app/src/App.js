import React, { useState, useEffect } from 'react';
import Sidebar from './components/Sidebar';
import DagViewer from './components/DagViewer';
import AnalysisPanel from './components/AnalysisPanel';
import { generateDagCode } from './utils/dagCodeGenerator';

function App() {
  const [nodes, setNodes] = useState([]);
  const [edges, setEdges] = useState([]);

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
      })
      .catch((error) => console.error('Error fetching data:', error));
  }, []);

  return (
    <div className="App" style={{ display: 'flex' }}>
      <Sidebar nodes={nodes} edges={edges} />
      <div style={{ flex: 1 }}>
        <DagViewer nodes={nodes} edges={edges} setNodes={setNodes} setEdges={setEdges} />
        <AnalysisPanel dagCode={generateDagCode(nodes, edges)} />
      </div>
    </div>
  );
}

export default App;
