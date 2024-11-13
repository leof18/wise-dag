import React, { useEffect, useRef, useState } from 'react';
import cytoscape from 'cytoscape';
import dagre from 'cytoscape-dagre';

cytoscape.use(dagre);

const DagViewer = ({ nodes, edges, onSelectNode }) => {
  const cyRef = useRef(null);
  const [selectedStrength, setSelectedStrength] = useState('');

  // Extract unique strength values for dropdown, filtering out NaN
  const uniqueStrengths = [...new Set(edges.map(edge => edge.strength))]
    .filter(strength => !isNaN(strength))
    .sort((a, b) => a - b);

  useEffect(() => {
    if (cyRef.current) {
      cyRef.current.innerHTML = '';
    }

    // Filter edges based on selected strength
    const filteredEdges = selectedStrength
      ? edges.filter(edge => edge.strength === parseFloat(selectedStrength))
      : edges;

    const cy = cytoscape({
      container: cyRef.current,
      elements: [
        ...nodes.map(node => ({
          data: { id: node.id, label: node.label || '' }
        })),
        ...filteredEdges.map(edge => ({
          data: {
            source: edge.source,
            target: edge.target,
            direction: edge.direction,
            strength: edge.strength,
            label: edge.direction // Display "increase" or "decrease" on edges
          }
        })),
      ],
      style: [
        {
          selector: 'node',
          style: {
            'background-color': '#E0E0E0',
            'label': 'data(label)',
            'text-valign': 'center',
            'text-halign': 'center',
            'color': '#000000', // Text color inside the node
            'font-size': '10px',
            'text-wrap': 'wrap',
            'text-max-width': '80px',
          }
        },
        {
          selector: 'edge',
          style: {
            'width': 2,
            'label': 'data(label)',
            'line-color': '#A0A0A0',
            'target-arrow-color': '#A0A0A0',
            'source-arrow-color': '#ccc',
            'target-arrow-shape': ele => ele.data('direction') === 'increase' ? 'triangle' : 'none', // Arrow at the end for "increase"
            'source-arrow-shape': ele => ele.data('direction') === 'decrease' ? 'triangle' : 'none', // Arrow at the start for "decrease"
            'text-rotation': 'autorotate',
            'font-size': '8px',
            'color': '#000000'
          }
        }
      ],
      layout: {
        name: 'dagre',
        directed: true,
        padding: 10,
        nodeSep: 30,
        edgeSep: 30
      }
    });

    cy.on('tap', 'node', event => {
      const node = event.target;
      onSelectNode({
        id: node.id(),
        label: node.data('label'),
        additionalInfo: node.data('additionalInfo') || "No additional info"
      });
    });

    return () => cy.destroy();
  }, [nodes, edges, onSelectNode, selectedStrength]);

  return (
    <div style={{ display: 'flex', height: '100%' }}>
      <div style={{ width: '200px', padding: '10px', backgroundColor: '#f4f4f4', borderRight: '1px solid #ddd' }}>
        <h3>Filters</h3>
        <label>Select Strength:</label>
        <select
          value={selectedStrength}
          onChange={e => setSelectedStrength(e.target.value)}
          style={{ width: '100%', marginBottom: '10px' }}
        >
          <option value="">All</option>
          {uniqueStrengths.map(strength => (
            <option key={strength} value={strength}>
              {strength}
            </option>
          ))}
        </select>
      </div>
      <div ref={cyRef} style={{ flex: 1, backgroundColor: '#f0f0f0' }} />
    </div>
  );
};

export default DagViewer;
