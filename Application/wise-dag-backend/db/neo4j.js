const neo4j = require('neo4j-driver');

// Initialize the Neo4j driver
const driver = neo4j.driver(
  'neo4j+s://b6ce9fc7.databases.neo4j.io',
  neo4j.auth.basic('neo4j', 'TKv0DRm0Rd51xgmMx9RnI-Kt9r5jS3Wbkw8MzWxGYgE')
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
