const express = require("express");
const router = express.Router();
const { driver } = require("../db/neo4j");

router.post("/initial-graph-query", async (req, res) => {
  const { exposure, outcome } = req.body;

  if (!exposure || !outcome) {
    return res.status(400).json({
      error: "Missing required parameters: exposure, outcome",
    });
  }

  const session = driver.session();

  try {

    const params = {
      exposure : exposure.value,
      outcome: outcome.value
    };

    let query = `
    // Step 1: Choose the best iteration based on score and iteration id
    MATCH (iteration:Iteration)
    OPTIONAL MATCH (iteration)<-[:PART_OF]-(exp:Concept {name: $exposure})
    OPTIONAL MATCH (iteration)<-[:PART_OF]-(out:Concept {name: $outcome})
    WITH iteration, exp, out,
         CASE 
           WHEN exp IS NOT NULL AND out IS NOT NULL THEN 2 
           WHEN exp IS NOT NULL OR out IS NOT NULL THEN 1 
           ELSE 0 
         END AS score
    WHERE score > 0
    ORDER BY score DESC, iteration.id ASC
    LIMIT 1
    `;
    
    if (exposure.type === "predefined" && outcome.type === "predefined") {
      query += `
    CALL apoc.do.when(
      score = 2, 
      'RETURN iteration, score, [] AS selectedNodes', 
      'WITH iteration, score, exp, out,
          (CASE 
            WHEN score = 1 AND exp IS NULL THEN $exposure
            WHEN score = 1 AND out IS NULL THEN $outcome
            ELSE null
          END) AS missingName
      CALL (iteration, missingName) {
        WITH iteration, missingName
        OPTIONAL MATCH (missing:Concept {name: missingName})
        WHERE missing IS NOT NULL
        MATCH (iteration)<-[:PART_OF]-(iterationNode:Concept)
        WITH iteration, missing, collect(iterationNode) AS iterationNodes
        UNWIND iterationNodes AS targetNode
        WITH iteration, missing, targetNode, shortestPath((missing)-[:SUBSUMES*]-(targetNode)) AS sp
        WHERE sp IS NOT NULL
        RETURN reverse([node IN nodes(sp)[1..] | node.name]) AS selectedNodes
        ORDER BY length(sp) ASC
        LIMIT 1
      }
      RETURN iteration, COALESCE(selectedNodes, []) AS selectedNodes', 
      { iteration: iteration, score: score, exp: exp, out: out, exposure: $exposure, outcome: $outcome }
    ) YIELD value
    RETURN value.iteration.id AS iterationId, value.selectedNodes AS selectedNodes
      `;
    } else {
      // Otherwise, simply return the iteration (with an empty selectedNodes list)
      query += `
      RETURN iteration.id AS iterationId, [] AS selectedNodes
      `;
    }

    console.log("Executing initial granularity query with params:", params);

    const result = await session.run(query, params);
    
    const records = result.records.map(record => {
      const iterationInt = record.get("iterationId");
      return {
        iteration: iterationInt.low, // convert the Neo4j integer to a JS number
        initSelectedNodes: record.get("selectedNodes")
      };
    });

      res.json({ success: true, data: records });
    } catch (error) {
      console.error("Error executing query:", error);
      res.status(500).json({ success: false, error: error.message });
    } finally {
      await session.close();
    }
  });

module.exports = router;
