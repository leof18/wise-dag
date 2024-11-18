import pandas as pd
import re

# Function to clean node names by retaining only alphanumeric and underscore characters
def clean_name(name):
    return re.sub(r'\W|^(?=\d)', '_', name).lower()

# Load CSV file
df = pd.read_csv('./data/DAGs_standardized.csv')

# Separate numeric exposures
numeric_exposures = df[df['Exposure'].apply(lambda x: str(x).isdigit())]

# Separate non-numeric or mixed exposures
non_numeric_exposures = df[~df['Exposure'].apply(lambda x: str(x).isdigit())]

# Process numeric exposures
numeric_exposures_list = numeric_exposures['Exposure'].unique()
outcomes_numeric = numeric_exposures['Outcome'].unique()
edges_numeric = numeric_exposures[['Exposure', 'Outcome']]

# Process non-numeric exposures
non_numeric_exposures_list = non_numeric_exposures['Exposure'].unique()
outcomes_non_numeric = non_numeric_exposures['Outcome'].unique()
edges_non_numeric = non_numeric_exposures[['Exposure', 'Outcome']]

# Combine numeric and non-numeric exposures
all_nodes_cleaned = list(set(numeric_exposures_list).union(non_numeric_exposures_list).union(outcomes_numeric).union(outcomes_non_numeric))

# Start DAGitty code
dagitty_code_cleaned_full = "dag {\n"

# Add nodes with cleaned names
for node in all_nodes_cleaned:
    cleaned_node = clean_name(node)
    node_type = "[outcome]" if node == "your_outcome_variable" else "[exposure]"
    dagitty_code_cleaned_full += f"{cleaned_node} {node_type}\n"

# Add edges for numeric exposures
for index, row in edges_numeric.iterrows():
    exposure = clean_name(row['Exposure'])
    outcome = clean_name(row['Outcome'])
    dagitty_code_cleaned_full += f"{exposure} -> {outcome}\n"

# Add edges for non-numeric exposures
for index, row in edges_non_numeric.iterrows():
    exposure = clean_name(row['Exposure'])
    outcome = clean_name(row['Outcome'])
    dagitty_code_cleaned_full += f"{exposure} -> {outcome}\n"

# Close DAGitty code block
dagitty_code_cleaned_full += "}"

# Save to a file
with open('DAGitty_DAG_Full_Cleaned_Standardized.txt', 'w') as file:
    file.write(dagitty_code_cleaned_full)
