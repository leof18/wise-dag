const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const graphRoutes = require('./routes/graphRoutes');
const iterationLevelRoutes = require('./routes/iterationLevelRoutes');

const app = express();
const PORT = 3001;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use('/api', graphRoutes);
app.use('/api', iterationLevelRoutes);

// Start Server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
