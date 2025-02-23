const express = require("express");
const router = express.Router();
const fs = require("fs");
const path = require("path");

// Route to serve the DAGitty input file
router.get("/dagitty-input", (req, res) => {
  const filePath = path.join(__dirname, "../dagitty_input.txt"); // Ensure this path is correct

  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      console.error("Error reading dagitty_input.txt:", err);
      return res.status(500).json({ error: "Failed to load DAGitty input file" });
    }
    res.json({ dagittyText: data });
  });
});

module.exports = router;
