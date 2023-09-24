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
num_var = adult_data.select_dtypes(exclude=['object'])
target = adult_data['class']

# Referenced code from https://python-charts.com/distribution/histogram-group-seaborn/

for var in num_var:

    plt.figure(figsize=(8, 5))
    sns.histplot(x=var, hue='class', data=adult_data, multiple='stack', stat='proportion')
    plt.title(f"Histogram overlay of {var} and income")
    plt.show()

for var in num_var:

    plt.figure(figsize=(8, 5))
    sns.histplot(x=var, hue='class', data=adult_data, multiple='fill', stat='proportion')
    plt.title(f"Histogram overlay of {var} and income")
    plt.show()

plt.close('all')