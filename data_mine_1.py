"""
Created on 9/12/2023
@author: aaavila

credit to: santoun
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# check column names
churn_data = pd.read_csv("./CSV/churn.csv")
print(churn_data.columns)

target_variable = 'Churn?'
if target_variable not in churn_data.columns:
    raise ValueError(f"The '{target_variable}' is missing")

# Select only numeric columns 
numeric_columns = churn_data.select_dtypes(include=['int64', 'float64']).columns
subset_data = churn_data[numeric_columns.tolist() + [target_variable]]

#Calculate correlation matrix between numeric variables and the target variable
correlation_matrix = subset_data.corr()

# plot a heatmap to visualize correlations 
plt.figure(figsize=(12, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt='.2f', linewidths=0.5)
plt.title('Correlation Matrix Heatmap')
plt.show()

# Scatter Plot
for column in numeric_columns:
    if column != target_variable:
        plt.figure(figsize=(8, 5))
        sns.scatterplot(data=churn_data, x=column, y=target_variable)
        plt.title(f"Scatterplot of {column} vs. {target_variable}")
        plt.xlabel(column)
        plt.ylabel(target_variable)
        plt.show()

plt.close('all')

