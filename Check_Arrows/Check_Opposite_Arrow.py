import pandas as pd
# Read dataframe
df = pd.read_csv('data/DAGs_standardized_with_time_Filled.csv')
# Add Entry ID for trouble-shooting of opposite arrows
df['Entry ID'] = range(1, len(df) + 1)
## Reorder Entry ID to the first column
df = df[['Entry ID'] + [col for col in df.columns if col != 'Entry ID']]
# Pair values in Exposure and Outcome columns
pairs = set(zip(df['Exposure_Standardized'], df['Outcome_Standardized']))
# check opposite arrows by iterating each row for pairs
Oppo_Arrow_df = df[df.apply(lambda row: (row['Outcome_Standardized'], row['Exposure_Standardized']) in pairs, axis=1)]
print(Oppo_Arrow_df)
# Export the table showing opposite arrows
Oppo_Arrow_df.to_csv('oppo_arrow_table_2.csv', index=False)
