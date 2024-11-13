import os
import pandas as pd

def combine_csv_files(folder_path, output_filename):

    combined_data = []

    for filename in os.listdir(folder_path):

        if filename.endswith('.csv'):

            file_path = os.path.join(folder_path, filename)

            df = pd.read_csv(file_path)

            id = filename[:2]
            status = "Final" if "Final" in filename else "Draft" if "Draft" in filename else "Unknown"

            df['ID'] = id
            df['Status'] = status

            combined_data.append(df)

    combined_df = pd.concat(combined_data, ignore_index=True) # To combine a list object with all dataframes into a dataframe

    combined_df.to_csv(output_filename, index=False)

folder_path = "data/individual_DAGs_csv/"
output_filename = "data/DAGs.csv"
combine_csv_files(folder_path, output_filename)
