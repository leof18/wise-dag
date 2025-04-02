from neo4j import GraphDatabase
from tqdm import tqdm
uri = "neo4j+s://b6ce9fc7.databases.neo4j.io"
username = "neo4j"
password = "TKv0DRm0Rd51xgmMx9RnI-Kt9r5jS3Wbkw8MzWxGYgE"

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
