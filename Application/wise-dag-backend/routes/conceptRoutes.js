const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

// Fetch concepts dynamically based on search term
router.post("/concepts", async (req, res) => {
  const { searchTerm } = req.body; // Expecting `searchTerm` in the request body

  if (!searchTerm || typeof searchTerm !== "string" || searchTerm.trim() === "") {
    return res.status(400).json({
      error: "Missing or invalid required parameter: searchTerm",
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

    const params = { searchTerm: searchTerm.trim() };

    console.log("Executing query with params:", params);

    const result = await session.run(query, params);

    const concepts = result.records.map((record) => record.get("ConceptName"));

    res.status(200).json({
      success: true,
      data: concepts,
    });
  } catch (error) {
    console.error(`Error executing Neo4j query with searchTerm "${searchTerm}":`, error);
    res.status(500).json({
      error: "An error occurred while fetching concepts",
      details: error.message,
    });
  } finally {
    await session.close();
  }
});

module.exports = router;
