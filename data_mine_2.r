# Load the necessary libraries
library(dplyr)

# set working directory
setwd("~/DataMining/CSV")

# load file 
churn_data <- read.csv("churn.csv")

str(churn_data)

# Filter data to create a sub group based on "Churn."
subgroup <- churn_data %>% filter(Churn. == "TRUE.")

# Summary stats for the subgroup
print(summary(subgroup))

subchurn <- subset(churn_data, Int.l.Plan=="yes" & VMail.Plan == "yes", Day.MinsChurn > 220)

# Summary stats of cust serv calls
# summary(subchurn$CustServ.Calls)

# Number of rows in the subset
# length(subchurn$CustServ.Calls)

# print each 
print(summary(subchurn$CustServ.Calls))
print(length(subchurn$CustServ.Calls))

# Perform a t-test for the mean of "CustServ.Calls" assuming a population mean of 
t_test_result <- t.test(subchurn$CustServ.Calls, mu = 2.4, conf.level = 0.95)

print(t_test_result)