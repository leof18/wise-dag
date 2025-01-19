import pandas as pd

nodes_df = pd.read_csv('data/graph_nodes.csv')
hierarchy_df = pd.read_csv('data/graph_relationships.csv')
causal_relationships_df = pd.read_csv('data/DAGs_standardized.csv')[['Exposure','Outcome','Direction','Strength']]

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
            f"    strength: {row['Strength']}\n"
            f"}}]->(o);"
        )
        cypher_statements.append(cypher_statement)
    return "\n".join(cypher_statements)


with open("output.cypher", "w") as file:
    file.write(cypher_output)