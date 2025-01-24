const neo4j = require('neo4j-driver');

// Initialize the Neo4j driver
const driver = neo4j.driver(
  'neo4j+s://2801843c.databases.neo4j.io',
  neo4j.auth.basic('neo4j', 'e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk')
);

// Verify the connection
const verifyConnection = async () => {
  try {
    const session = driver.session();
    await session.run('RETURN 1');
    console.log('Connected to Neo4j successfully!');
    session.close();
  } catch (error) {
    console.error('Error connecting to Neo4j:', error);
  }
};

verifyConnection(); // Call the connection verification function

module.exports = { driver };
