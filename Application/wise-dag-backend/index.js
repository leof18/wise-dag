const express = require('express');
const cors = require('cors');
const Papa = require('papaparse');
const fs = require('fs');
const app = express();
const PORT = 3001;

app.use(cors());
app.use(express.json());

// Load and parse the CSV file containing causal relationships
app.get('/api/data', (req, res) => {
  fs.readFile('./data/individual_DAGs_csv/05_Draft.csv', 'utf8', (err, csvData) => {
    if (err) {
      return res.status(500).json({ error: 'Failed to load data' });
    }
    // Parse CSV data
    Papa.parse(csvData, {
      header: true,
      complete: (result) => {
        res.json(result.data);
      },
      error: (error) => {
        res.status(500).json({ error: 'Error parsing CSV data' });
      }
    });
  });
});

// Endpoint to query data by strength or other parameters
app.post('/api/query', (req, res) => {
  const { strength } = req.body;
  fs.readFile('./data/03_Draft.csv', 'utf8', (err, csvData) => {
    if (err) {
      return res.status(500).json({ error: 'Failed to load data' });
    }
    Papa.parse(csvData, {
      header: true,
      complete: (result) => {
        // Filter data based on the query
        const filteredData = result.data.filter(
          item => parseFloat(item.strength) === parseFloat(strength)
        );
        res.json(filteredData);
      },
      error: (error) => {
        res.status(500).json({ error: 'Error parsing CSV data' });
      }
    });
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
