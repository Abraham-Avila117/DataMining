churn <- read.csv(file="./CSV/churn.csv", stringsAsFactors = TRUE)

#Show some records
head(churn)

# Summarize the Churn variable
print("-------------------------------------------------")
sum.churn <- summary(churn$Churn)
sum.churn

#proportion of churners
prop.churn <- sum(churn$Churn ==  "True") / length(churn$Churn)
prop.churn

#continue on chapter 
install.packages("ggplot2")
ggplot() + geom_bar(data=churn, aes(x=factor(churn$CustServ.Calls), fill=factor(churn$Churn)), position="slack") + scale_x_discrete("Customer Service Calls") + scale_y_continuous("Percent") + guides(fill=guide_legend(title="Churn")) + scale_fill_manual(values=c("blue", "red"))


