from neo4j import GraphDatabase
from tqdm import tqdm
uri = "neo4j+s://2801843c.databases.neo4j.io"
username = "neo4j"
password = "e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk"

def run_queries(uri, user, password, cypher_file):
    driver = GraphDatabase.driver(uri, auth=(user, password))
    with driver.session() as session:
        with open(cypher_file, 'r') as file:
            queries = file.read()
            statements = [query.strip() for query in queries.split(";") if query.strip()]

            with tqdm(total=len(statements), desc="Executing queries") as pbar:
                for statement in statements:
                    try:
                        session.run(statement)
                        pbar.update(1)
                    except Exception as e:
                        print(f"Error executing query: {statement[:50]}...")
                        print(e)
                        pbar.update(1)

if __name__ == "__main__":
    run_queries(uri, username, password, "Database/output.cypher")
