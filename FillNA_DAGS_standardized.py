import pandas as pd
df = pd.read_csv('data/DAGs_standardized_with_time.csv')
df['Exposure_Standardized'] = df['Exposure_Standardized'].fillna(df['Exposure'])
print("Missing values in Exposure_Standardized", sum(df['Exposure_Standardized'].isna()))
df['Outcome_Standardized'] = df['Outcome_Standardized'].fillna(df['Outcome'])
print("Missing values in Outcome_Standardized", sum(df['Outcome_Standardized'].isna()))
df.to_csv('data/DAGs_standardized_with_time_Filled.csv', index=False)