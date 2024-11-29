import pandas as pd
# Read the standardized dataset with time
df = pd.read_csv('data/DAGs_standardized_with_time.csv')
# Since we disassemble compound terms into original terms, the field is NA now. We need to fill the NA with original terms
df['Exposure_Standardized'] = df['Exposure_Standardized'].fillna(df['Exposure'])
# Check if NA is filled in the "Exposure_Standardized" column
print("Missing values in Exposure_Standardized", sum(df['Exposure_Standardized'].isna()))
# Fill the NA with original terms in the "Outcome_Standardized" column
df['Outcome_Standardized'] = df['Outcome_Standardized'].fillna(df['Outcome'])
# Check if NA is filled in the "Outcome_Standardized" column
print("Missing values in Outcome_Standardized", sum(df['Outcome_Standardized'].isna()))
# Export
df.to_csv('data/DAGs_standardized_with_time_Filled.csv', index=False)