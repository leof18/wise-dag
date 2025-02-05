const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

// Fetch concepts dynamically based on search term
router.get("/concepts", async (req, res) => {
  const { searchTerm } = req.query; // Fetch `searchTerm` from query parameters

  if (!searchTerm) {
    return res.status(400).json({
      error: "Missing required parameter: searchTerm",
    });
  }

  const session = driver.session();

  try {
    const query = `
      MATCH (concept:Concept)
    WHERE toLower(concept.name) STARTS WITH toLower($searchTerm)
    RETURN concept.name AS ConceptName
    ORDER BY concept.name ASC
    LIMIT 10
    `;

    const params = { searchTerm };

    console.log("Executing query with params:", params);

    const result = await session.run(query, params);

    const concepts = result.records.map((record) => record.get("ConceptName"));

    res.status(200).json({
      success: true,
      data: concepts,
    });
  } catch (error) {
    console.error("Error executing Neo4j query:", error);
    res.status(500).json({
      error: "An error occurred while fetching concepts",
      details: error.message,
    });
  } finally {
    await session.close();
  }
});

module.exports = router;
