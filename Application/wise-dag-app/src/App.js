import React, { useState, useEffect } from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import {
  Box,
  Typography,
  Slider,
  TextField,
  Grid,
  CssBaseline,
  AppBar,
  Toolbar,
} from "@mui/material";

import HomePage from "./components/HomePage"; // Import the Home Page component
import DagViewer from "./components/DagViewer";
import AnalysisPanel from "./components/AnalysisPanel";
import Tutorial from "./components/Tutorial";
import "./index.css";
import UndoRedoControls from "./components/UndoRedoControls";
import { generateDagCode } from "./utils/dagCodeGenerator";
import { detectCycle } from "./utils/detectCycle";
import Sidebar from "./components/Sidebar";

function App() {
  const [nodes, setNodes] = useState([]);
  const [edges, setEdges] = useState([]);
  const [filteredEdges, setFilteredEdges] = useState([]);
  const [granularity, setGranularity] = useState(1);
  const [timepoints, setTimepoints] = useState(1);
  const [undoStack, setUndoStack] = useState([]);
  const [redoStack, setRedoStack] = useState([]);
  const [showTutorial, setShowTutorial] = useState(true);

  useEffect(() => {
    fetch("http://localhost:3001/api/data")
      .then((response) => response.json())
      .then((data) => {
        const initialNodes = [];
        const initialEdges = [];

        data.forEach((row) => {
          const exposure = row.Exposure;
          const outcome = row.Outcome;
          const direction = row.Direction;
          const strength = parseFloat(row.Strength);

          if (!initialNodes.some((node) => node.id === exposure)) {
            initialNodes.push({ id: exposure, label: exposure, granularityLevel: 1 });
          }
          if (!initialNodes.some((node) => node.id === outcome)) {
            initialNodes.push({ id: outcome, label: outcome, granularityLevel: 1 });
          }
          initialEdges.push({ source: exposure, target: outcome, direction, strength });
        });

        setNodes(initialNodes);
        setEdges(initialEdges);
        setFilteredEdges(initialEdges);
      })
      .catch((error) => console.error("Error fetching data:", error));
  }, []);

  const handleGranularityChange = (event, newValue) => {
    setGranularity(newValue);
    const updatedNodes = nodes.map((node) => ({
      ...node,
      granularityLevel: newValue,
    }));
    setNodes(updatedNodes);
  };

  const handleTimepointsChange = (event) => {
    setTimepoints(Number(event.target.value));
    const updatedNodes = [];
    const updatedEdges = [];

    for (let i = 1; i <= Number(event.target.value); i++) {
      nodes.forEach((node) => {
        const timepointNode = { ...node, id: `${node.id}_T${i}`, label: `${node.label} (T${i})` };
        updatedNodes.push(timepointNode);
      });

      edges.forEach((edge) => {
        const timepointEdge = {
          ...edge,
          source: `${edge.source}_T${i}`,
          target: `${edge.target}_T${i}`,
        };
        updatedEdges.push(timepointEdge);
      });
    }

    setNodes(updatedNodes);
    setEdges(updatedEdges);
  };

  const handleUndo = () => {
    if (undoStack.length > 0) {
      const previousState = undoStack.pop();
      setRedoStack([...redoStack, { nodes, edges }]);
      setNodes(previousState.nodes);
      setEdges(previousState.edges);
    }
  };

  const handleRedo = () => {
    if (redoStack.length > 0) {
      const nextState = redoStack.pop();
      setUndoStack([...undoStack, { nodes, edges }]);
      setNodes(nextState.nodes);
      setEdges(nextState.edges);
    }
  };

  const handleClear = () => {
    setUndoStack([...undoStack, { nodes, edges }]);
    setNodes([]);
    setEdges([]);
    setFilteredEdges([]);
  };

  const handleConflictResolution = () => {
    const hasCycle = detectCycle(nodes, edges);
    if (hasCycle) {
      alert("Conflict detected! Please resolve.");
    }
  };

  const handleTutorialFinish = () => {
    setShowTutorial(false);
  };

  return (
    <Router>
      <CssBaseline />
      <Routes>
        {/* Home Page Route */}
        <Route path="/" element={<HomePage />} />

        {/* Dashboard Route */}
        <Route
          path="/dashboard"
          element={
            <Box sx={{ height: "100vh", display: "flex", flexDirection: "column" }}>
              <AppBar position="static">
                <Toolbar>
                  <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
                    WISE DAG
                  </Typography>
                </Toolbar>
              </AppBar>
              <Box sx={{ flex: 1, display: "flex", flexDirection: "row", overflow: "hidden" }}>
                <Sidebar nodes={nodes} edges={edges} onFilterChange={() => {}} />
                <Box sx={{ flex: 1, display: "flex", flexDirection: "column", padding: 2 }}>
                  <Grid container spacing={2} alignItems="center">
                    <Grid item xs={6}>
                      <Typography variant="body1">Granularity:</Typography>
                      <Slider
                        value={granularity}
                        onChange={handleGranularityChange}
                        step={1}
                        min={1}
                        max={26}
                        valueLabelDisplay="auto"
                      />
                    </Grid>
                    <Grid item xs={6}>
                      <TextField
                        label="Timepoints"
                        type="number"
                        value={timepoints}
                        onChange={handleTimepointsChange}
                        variant="outlined"
                        fullWidth
                      />
                    </Grid>
                  </Grid>
                  <UndoRedoControls
                    onUndo={handleUndo}
                    onRedo={handleRedo}
                    onClear={handleClear}
                    onConflictResolution={handleConflictResolution}
                  />
                  <Box sx={{ flex: 1, mt: 2, border: "1px solid #ccc", borderRadius: 2, overflow: "hidden" }}>
                    <DagViewer nodes={nodes} edges={filteredEdges} onSelectNode={() => {}} />
                  </Box>
                  <AnalysisPanel dagCode={generateDagCode(nodes, filteredEdges)} />
                </Box>
              </Box>
            </Box>
          }
        />
      </Routes>
    </Router>
  );
}

export default App;
