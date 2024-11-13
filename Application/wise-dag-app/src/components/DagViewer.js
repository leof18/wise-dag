import React, { useEffect, useRef } from 'react';
import cytoscape from 'cytoscape';
import dagre from 'cytoscape-dagre';

cytoscape.use(dagre);

const DagViewer = ({ nodes, edges, onSelectNode }) => {
  const cyRef = useRef(null);

  useEffect(() => {
    if (cyRef.current) {
      cyRef.current.innerHTML = '';
    }

    const cy = cytoscape({
      container: cyRef.current,
      elements: [
        ...nodes.map(node => ({
          data: { id: node.id, label: node.label || '' }
        })),
        ...edges.map(edge => ({
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
  }, [nodes, edges, onSelectNode]);

  return (
    <div ref={cyRef} style={{ width: '100%', height: '100%', backgroundColor: '#f0f0f0' }} />
  );
};

export default DagViewer;
