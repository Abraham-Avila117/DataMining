import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

churn_path = "../CSV/churn.csv"
adult_path = "../CSV/adults.csv"

churn_data = pd.read_csv(churn_path)
adult_data = pd.read_csv(adult_path)

print(churn_data.head())
print("+-----------------------------------------------------------------------------+")
print(adult_data.head())

# Identify and define the categorical columns
categorical_columns = adult_data.select_dtypes(include=['object']).columns

# Loop through pairs of categorical columns and create cross-tabulations
for i, col1 in enumerate(categorical_columns):
    for col2 in categorical_columns[i+1:]:
        cross_tab = pd.crosstab(adult_data[col1], adult_data[col2])
        
        # Display the cross-tabulation and discuss results
        print(f"Cross-Tabulation between {col1} and {col2}:\n")
        print(cross_tab)
        print("\n-------------------------------------------------\n")