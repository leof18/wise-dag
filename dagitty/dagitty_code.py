import pandas as pd
import re

# Function to clean node names by retaining only alphanumeric and underscore characters
def clean_name(name):
    return re.sub(r'\W|^(?=\d)', '_', name).lower()

# Load CSV file
df = pd.read_csv('../data/DAGs.csv')

# Extract unique exposures and outcomes and create edges
exposures = df['Exposure'].unique()
outcomes = df['Outcome'].unique()
edges = df[['Exposure', 'Outcome']]

# Start DAGitty code
dagitty_code_cleaned_full = "dag {\n"

# Define all unique nodes with cleaned names
all_nodes_cleaned = list(set(exposures).union(set(outcomes)))
for node in all_nodes_cleaned:
    cleaned_node = clean_name(node)
    node_type = "[outcome]" if node == "your_outcome_variable" else "[exposure]"
    dagitty_code_cleaned_full += f"{cleaned_node} {node_type}\n"

# Add directed edges from exposures to outcomes with cleaned names
for index, row in edges.iterrows():
    exposure = clean_name(row['Exposure'])
    outcome = clean_name(row['Outcome'])
    dagitty_code_cleaned_full += f"{exposure} -> {outcome}\n"

# Close DAGitty code block
dagitty_code_cleaned_full += "}"

# Save to a file
with open('DAGitty_DAG_Full_Cleaned.txt', 'w') as file:
    file.write(dagitty_code_cleaned_full)
