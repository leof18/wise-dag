import math

from neo4j import GraphDatabase
import networkx as nx
import os
import matplotlib.pyplot as plt
from networkx.drawing.nx_agraph import from_agraph
uri = "neo4j+s://2801843c.databases.neo4j.io"
username = "neo4j"
password = "e16qCtDNDN9YFk3ihqOyRsaf_bklHJr8cEPMTq5fnQk"

# Initialize the driver
driver = GraphDatabase.driver(uri, auth=(username, password))


def find_all_cycles(edges):
    G = nx.DiGraph()
    G.add_edges_from(edges)
    cycles = list(nx.simple_cycles(G))
    return cycles, G

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

exposure = "Obesity"
outcome = "Disability"

query = """
MATCH (concept)-[part_of:PART_OF]->(iteration:IterationLevel {level: 70})
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



# Find all cycles
cycles, G = find_all_cycles(dagitty_edges)

if cycles:
    print(f"Total Cycles Detected: {len(cycles)}\n")
    for idx, cycle in enumerate(cycles, 1):
        cycle_path = " → ".join([f'"{node}"' for node in cycle + [cycle[0]]])
        print(f"Cycle {idx}: {cycle_path}")


else:
    print("No cycles detected. The graph is a DAG.")


unique_elements = set()
for source, target in dagitty_edges:
    unique_elements.add(source)
    unique_elements.add(target)

# Create a directed graph
G = nx.DiGraph()
G.add_edges_from(dagitty_edges)

# Compute positions using a spring layout

spacing_k =len(unique_elements)**1.45/(len(unique_elements))
print(spacing_k)
pos = nx.spring_layout(G, seed=42, k=spacing_k, iterations=50)  # 'k' controls spacing

scale_factor = 10
dagitty_positions = {node: (round(x * scale_factor, 2), round(y * scale_factor, 2)) for node, (x, y) in pos.items()}


# Find min and max coordinates
x_values = [pos[0] for pos in dagitty_positions.values()]
y_values = [pos[1] for pos in dagitty_positions.values()]

x_min, x_max = min(x_values), max(x_values)
y_min, y_max = min(y_values), max(y_values)

# Add some padding
padding = 2
bounding_box = f'bb="{x_min - padding},{y_min - padding},{x_max + padding},{y_max + padding}"'



dagitty_code = ["dag {"]
dagitty_code.append(bounding_box)
for concept in unique_elements:
    pos_str = f'pos="{dagitty_positions[concept][0]},{dagitty_positions[concept][1]}"]'
    if concept == exposure:
        dagitty_code.append(f'"{concept}" [exposure, {pos_str}')
    elif concept == outcome:
        dagitty_code.append(f'"{concept}" [outcome, {pos_str}')
    else:
        dagitty_code.append(f'"{concept}" [{pos_str}')
for source, target in dagitty_edges:
    dagitty_code.append(f'"{source}" -> "{target}"')
dagitty_code.append("}")
with open("dags.txt", "w") as f:
    f.write("\n".join(dagitty_code))
# Print DAGitty code
print("\n".join(dagitty_code))

#TODO DropDown exposure outcome --> dagitty code
#TODO Canvas change
