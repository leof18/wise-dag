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

// To start the development mode, type "node server.js --local"
const isLocal = process.argv.includes("--local");

// Set the correct HOST and PORT
const HOST = isLocal ? "localhost" : "0.0.0.0";
const PORT = isLocal ? 3001 : process.env.PORT || 3000;




app.get("/", (req, res) => {
  res.send("Hello from Render!");
});

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

// Start the server with the correct host
app.listen(PORT, HOST, () => {
  console.log(`Server running on http://${HOST}:${PORT}`);
});
