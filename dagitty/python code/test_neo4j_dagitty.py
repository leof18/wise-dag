from neo4j import GraphDatabase
import networkx as nx
import os

uri = "neo4j+s://2801843c.databases.neo4j.io"
username = "neo4j"
password = "e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk"

# Initialize the driver
driver = GraphDatabase.driver(uri, auth=(username, password))


def generate_dagitty_edges(query):
    edges = []
    with driver.session() as session:
        result = session.run(query)
        for record in result:
            concept = record["Concept"]
            caused_concepts = record["CausedConcepts"]
            for caused in caused_concepts:
                edge = (concept, caused)
                edges.append(edge)
    return edges



query = """
MATCH (concept)-[part_of:PART_OF]->(iteration:IterationLevel {level: 15})
OPTIONAL MATCH (concept)-[causes:CAUSES]->(otherConcept)-[:PART_OF]->(iteration)
WHERE otherConcept.name IS NOT NULL
RETURN 
    concept.name AS Concept,
    iteration.level AS IterationLevel,
    collect(otherConcept.name) AS CausedConcepts
ORDER BY Concept;
"""

# Generate DAGitty edges
dagitty_edges = generate_dagitty_edges(query)

# Close the driver
driver.close()


def find_all_cycles(edges):
    G = nx.DiGraph()
    G.add_edges_from(edges)
    cycles = list(nx.simple_cycles(G))
    return cycles, G

# Find all cycles
cycles, G = find_all_cycles(dagitty_edges)

if cycles:
    print(f"Total Cycles Detected: {len(cycles)}\n")
    for idx, cycle in enumerate(cycles, 1):
        cycle_path = " → ".join([f'"{node}"' for node in cycle + [cycle[0]]])
        print(f"Cycle {idx}: {cycle_path}")


else:
    print("No cycles detected. The graph is a DAG.")

# Proceed to generate DAGitty code if needed
dagitty_code = ["dag {"]
for source, target in dagitty_edges:
    dagitty_code.append(f'  "{source}" -> "{target}"')
dagitty_code.append("}")
with open("dags.txt", "w") as f:
    f.write("\n".join(dagitty_code))
# Print DAGitty code
print("\n".join(dagitty_code))
