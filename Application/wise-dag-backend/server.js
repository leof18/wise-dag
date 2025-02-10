const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { driver } = require('./db/neo4j');
const graphRoutes = require('./routes/graphRoutes');
const iterationLevelRoutes = require('./routes/iterationLevelRoutes');
const causalQueryRoutes = require('./routes/causalQueryRoutes');
const granularityQuery = require('./routes/granularityQuery');
const conceptRoutes = require('./routes/conceptRoutes');
const dagittyCyclesCheck = require('./routes/dagittyCyclesCheck');


const app = express();
const PORT = 3001;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use('/api', graphRoutes);
app.use('/api', iterationLevelRoutes);
app.use('/api', causalQueryRoutes);
app.use('/api', granularityQuery);
app.use('/api', conceptRoutes);
app.use('/api', dagittyCyclesCheck);

// Close Neo4j connection when server stops
process.on('SIGINT', async () => {
  await driver.close();
  process.exit(0);
});

// Start Server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
