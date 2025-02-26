const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { driver } = require('./db/neo4j');
const initialGranularityQuery = require('./routes/initialGranularityQuery');
const granularityQuery = require('./routes/granularityQuery');
const conceptRoutes = require('./routes/conceptRoutes');
const dagittyCyclesCheck = require('./routes/dagittyCyclesCheck');
const dagittyInputRoute = require("./routes/dagittyInput");
const hierarchyQuery = require("./routes/hierarchyQuery");

const app = express();
const PORT = 3001;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Routes
app.use('/api', conceptRoutes);
app.use('/api', initialGranularityQuery);
app.use('/api', granularityQuery);
app.use('/api', dagittyCyclesCheck);
app.use('/api', dagittyInputRoute);
app.use('/api', hierarchyQuery);

// Close Neo4j connection when server stops
process.on('SIGINT', async () => {
  await driver.close();
  process.exit(0);
});

// Start Server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
