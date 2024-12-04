const express = require("express");
const cors = require("cors");
const Papa = require("papaparse");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = 3001;

// Middleware
app.use(cors());
app.use(express.json());

// Endpoint to fetch CSV data
app.get("/api/data", (req, res) => {
  const filePath = path.join(__dirname, "data", "dummy.csv"); // Correct path to CSV file

  fs.readFile(filePath, "utf8", (err, csvData) => {
    if (err) {
      console.error("Error reading CSV file:", err);
      return res.status(500).json({ error: "Failed to load data" });
    }

    // Parse CSV data
    Papa.parse(csvData, {
      header: true,
      complete: (result) => {
        res.json(result.data);
      },
      error: (error) => {
        console.error("Error parsing CSV:", error);
        res.status(500).json({ error: "Error parsing CSV data" });
      },
    });
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
