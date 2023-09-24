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

# we will choose hours-per-week as the variable to perform binning
var = 'hours-per-week:'
target = adult_data['class']
num_var = adult_data[var]

# original histogram of hours-per-week: variable
plt.figure(figsize=(8, 5))
sns.histplot(x=var, hue='class', data=adult_data, multiple='fill', stat='proportion')
plt.title(f"Histogram overlay of {var} and income")
plt.show()

# maximized binning 
plt.figure(figsize=(8, 5))
sns.histplot(x=var, hue='class', data=adult_data, multiple='fill', stat='proportion', bins=[0, 16.5, 33, 49.5, 66, 82.5, 99])
plt.title(f"Histogram overlay of {var} and income")
plt.show()

# minimized binning
plt.figure(figsize=(8, 5))
sns.histplot(x=var, hue='class', data=adult_data, multiple='fill', stat='proportion', bins=[0,49.5, 99])
plt.title(f"Histogram overlay of {var} and income")
plt.show()

plt.close('all')