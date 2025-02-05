import pandas as pd
import json

nodes_df = pd.read_csv('data/graph_nodes.csv')
hierarchy_df = pd.read_csv('data/graph_relationships.csv')
causal_relationships_df = pd.read_csv('data/graph_causal_relationships.csv')
with open('data/iterations_dict.json','r') as json_file:
    iterations_dict = json.load(json_file)

def create_nodes_in_cypher(df):
    cypher_statements = []
    for _, row in df.iterrows():
        cypher_statement = (
            f"CREATE (:Concept {{\n"
            f"    id: {row['concept_id']},\n"
            f"    name: \"{row['concept_name']}\",\n"
            f"    class: \"{row['concept_class_id']}\",\n"
            f"    type: \"{row['type']}\"\n"
            f"}});"
        )
        cypher_statements.append(cypher_statement)
    return "\n\n".join(cypher_statements)

def create_hierarchy_in_cypher(df):
    cypher_statements = []
    for _, row in df.iterrows():
        cypher_statement = (
            f"MERGE (c1:Concept {{id: {row['concept_id_1']}}}) "
            f"MERGE (c2:Concept {{id: {row['concept_id_2']}}}) "
            f"MERGE (c1)-[:{row['type'].upper()}]->(c2);"
        )
        cypher_statements.append(cypher_statement)
    return "\n".join(cypher_statements)

def create_causal_relationships_in_cypher(df):
    cypher_statements = []
    for _, row in df.iterrows():
        cypher_statement = (
            f"MATCH (e:Concept {{id: {row['Exposure']}}}), (o:Concept {{id: {row['Outcome']}}}) "
            f"CREATE (e)-[:CAUSES {{\n"
            f"    direction: \"{row['Direction']}\",\n"
            f"    confidence_sum: {row['Confidence_Sum']},\n"
            f"    confidence_mean: {row['Confidence_Mean']},\n"
            f"    confidence_direction: {row['Confidence_Direction']}\n"
            f"}}]->(o);"
        )
        cypher_statements.append(cypher_statement)
    return "\n".join(cypher_statements)

def create_iteration_nodes_in_cypher(iterations_dict):
    cypher_statements = []
    for iteration in iterations_dict.keys():
        cypher_statement = (
            f"CREATE (:Iteration {{\n"
            f"    id: {iteration}\n"
            f"}});"
        )
        cypher_statements.append(cypher_statement)
    return "\n\n".join(cypher_statements)

def create_part_of_relationships_in_cypher(iterations_dict):
    cypher_statements = []
    for iteration, node_ids in iterations_dict.items():
        for node_id in node_ids:
            cypher_statement = (
                f"MATCH (c:Concept {{id: {node_id}}}), (i:Iteration {{id: {iteration}}}) "
                f"CREATE (c)-[:PART_OF]->(i);"
            )
            cypher_statements.append(cypher_statement)
    return "\n".join(cypher_statements)

def create_inferred_causal_relationships_in_cypher():
    return (
        "MATCH (ancestor:Concept)-[:SUBSUMES*]->(descendant:Concept)-[:CAUSES]->(effect:Concept)\n"
        "MERGE (ancestor)-[:CAUSES]->(effect);"
    )

def created_causal_relationships_between_ancestors():
    return (
        "MATCH (ancestor1:Concept)-[:SUBSUMES*]->(descendant1:Concept)-[:CAUSES]->(descendant2:Concept)<-[:SUBSUMES*]-(ancestor2:Concept)\n"
        "WHERE ancestor1 <> ancestor2\n"
        "MERGE (ancestor1)-[:CAUSES]->(ancestor2);"
    )

if __name__ == "__main__":
    cypher_output = ""
    cypher_output += create_nodes_in_cypher(nodes_df) + "\n\n"
    cypher_output += create_hierarchy_in_cypher(hierarchy_df) + "\n\n"
    cypher_output += create_causal_relationships_in_cypher(causal_relationships_df) + "\n\n"
    cypher_output += create_iteration_nodes_in_cypher(iterations_dict) + "\n\n"
    cypher_output += create_part_of_relationships_in_cypher(iterations_dict) + "\n\n"
    cypher_output += create_inferred_causal_relationships_in_cypher()
    with open("Database/output.cypher", "w") as file:
        file.write(cypher_output)