const neo4j = require('neo4j-driver');

(async () => {
  const URI = "neo4j+s://2801843c.databases.neo4j.io"; // Replace with your Neo4j URI
  const USER = "neo4j"; // Replace with your Neo4j username
  const PASSWORD = "e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk"; // Replace with your Neo4j password

  let driver;

  try {
    // Initialize the driver
    driver = neo4j.driver(URI, neo4j.auth.basic(USER, PASSWORD));
    const serverInfo = await driver.getServerInfo();
    console.log('Connection established');
    console.log(serverInfo);

    // Create a session
    const session = driver.session();

    // Define parameters
    const parameters = {
      selectedIteration: { id: 1 },
      selectedNodes: { name: [""] },
    };

    // Define your Cypher query
    const query = `
        MATCH (iteration:Iteration {id: $selectedIteration.id})
        MATCH (concept:Concept)-[:PART_OF]->(iteration)
        WITH collect(concept) AS initialConcepts
        OPTIONAL MATCH (excludedNodes:Concept)
        WHERE $selectedNodes.name <> [""] AND excludedNodes.name IN $selectedNodes.name
        OPTIONAL MATCH (excludedNodes)-[:SUBSUMES]->(child:Concept)
        WITH initialConcepts, collect(child) AS children, excludedNodes
        WITH initialConcepts + children AS combinedNodes, excludedNodes
        WITH CASE 
                WHEN $selectedNodes.name = [""] THEN combinedNodes
                ELSE [node IN combinedNodes WHERE NOT node.name IN $selectedNodes.name]
            END AS finalNodes
        RETURN COLLECT(DISTINCT finalNodes) AS resultingNodes;
    `;

    // Run the query
    const result = await session.run(query, parameters);

    // Process and display results
    console.log('Query executed successfully.');
    result.records.forEach(record => {
      console.log('Resulting Nodes:', record.get('resultingNodes'));
    });

    // Close the session
    await session.close();

  } catch (err) {
    console.error(`Connection or query error:\n${err}`);
  } finally {
    // Close the driver
    if (driver) {
      await driver.close();
    }
  }
})();
