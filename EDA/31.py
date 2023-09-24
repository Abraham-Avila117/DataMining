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

# exclude any data that does not contain numerical data
num_var = adult_data.select_dtypes(exclude=['object']).columns
print(num_var)

for i, var1 in enumerate(num_var):
    for var2 in num_var[i+1:]:
        if var1 != var2:
            plt.figure(figsize=(8, 5))
            sns.scatterplot(data=adult_data, x=var1, y=var2)
            plt.title(f"Scatterplot of {var1} vs. {var2}")
            plt.show()

plt.close('all')