import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

#Get csv data and print the heads of each csv-file

churn_path = "../CSV/churn.csv"
adult_path = "../CSV/adults.csv"

churn_data = pd.read_csv(churn_path)
adult_data = pd.read_csv(adult_path)

print(churn_data.head())
print("+-----------------------------------------------------------------------------+")
print(adult_data.head())

# exclude any data that does not contain numerical data, then print the columns
num_var = adult_data.select_dtypes(exclude=['object']).columns
print(num_var)

# Calculate each Column's mean, median, mode, minimum, maximum, and standard deviation

for var in num_var:
    # mean 
    print(f"{var}: mean = {adult_data[var].mean()}")

    # median 
    print(f"{var}: median = {adult_data[var].median()}")

    # mode 
    print(f"{var}: mode \n{adult_data[var].mode()}")

    # minimum
    print(f"{var}: minimum = {adult_data[var].min()}")

    # maximum 
    print(f"{var}: maximum = {adult_data[var].max()}")

    # standard deviation
    print(f"{var}: std = {adult_data[var].std()}")
    print("+---------------------------------------------------+")

    # print(n)



