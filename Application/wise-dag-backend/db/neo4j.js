const neo4j = require('neo4j-driver');

const driver = neo4j.driver(
  'neo4j+s://2801843c.databases.neo4j.io',
  neo4j.auth.basic('neo4j', 'e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk')
);

const getSession = () => driver.session();

module.exports = { driver, getSession };
