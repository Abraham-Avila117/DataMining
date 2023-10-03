library(ggplot2)

setwd("~/DataMining/CSV")

churn_data <- read.csv("churn.csv")

# Subset the data for categorical variable to analyze
categorical_variable <- "Area.CodeChurn"
subset_data <- churn_data

# create a data frame to store the count for the categorical variable
count_data <- date.frame(table(subset_data[[categorical_variable]]))

# create a normalized version of the data
count_data$NormalizedCount <- count_data$Freq/sum(data$Freq)

#create bar chart for raw data
ggplot(count_data, aes(x = reorder(Var1, Freq), y=Freq))+geom_bar(stat = "identity", fill="blue")+labs(x=categorical_variable, y="Frequency")+ggtitle("Bar chart (Not Normalized)")
