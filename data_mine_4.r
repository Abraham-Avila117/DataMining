
# Last Tuesday we ran into a graph issue, researching it differences in ggplot2 as opposed to older version...

# To get the source executed from a script we needed to wrap it into a print command because, by default now, R does not display plots when running scripts using source.

# To display the plot, we can do the following:

# Add the print() function around the ggplot code in our script to explicitly print the plot when running the script:

# E.G:

# Load necessary libraries
library(ggplot2)

# Script 1: Scatter Plot with Linear Regression Line
# This plot visualizes the relationship between "Day Minutes" and "Evening Minutes" while considering "Churn" status.
scatter_plot <- ggplot(churn_data, aes(x = Day.Mins, y = Eve.Mins)) +
  geom_point(aes(color = Churn.)) +                
  geom_smooth(method = "lm", se = FALSE) +         
  labs(x = "Day Minutes", y = "Evening Minutes") +  
  ggtitle("Scatter Plot: Day Minutes vs. Evening Minutes") +  
  scale_color_manual(values = c("False." = "blue", "True." = "red")) + 
  facet_wrap(~ Churn.) +                          
  theme_minimal()                               

# Explicitly print the scatter plot
print(scatter_plot)

# Script 2: Box Plot with Churn Overlay
# This plot presents box plots of "Day Minutes" for different "Area Codes" with "Churn" status overlaid.
box_plot <- ggplot(churn_data, aes(x = as.factor(Area.Code), y = Day.Mins, fill = Churn.)) +
  geom_boxplot() +                               
  labs(x = "Area Code", y = "Day Minutes") +      
  ggtitle("Box Plot: Day Minutes by Area Code with Churn Overlay") + 
  scale_fill_manual(values = c("False." = "blue", "True." = "red")) +  
  theme_minimal()                               

# Explicitly print the box plot
print(box_plot)

# Script 3: Histogram with Churn Overlay
# This plot displays histograms of "Day Minutes" while considering "Churn" status.
histogram_plot <- ggplot(churn_data, aes(x = Day.Mins, fill = Churn.)) +
  geom_histogram(binwidth = 10, position = "dodge") +  # Create histograms with dodge position
  labs(x = "Day Minutes", y = "Count") +            # Label x and y axes
  ggtitle("Histogram: Day Minutes with Churn Overlay") +  # Add a title
  scale_fill_manual(values = c("False." = "blue", "True." = "red")) +  # Customize color scale
  facet_wrap(~ Churn.) +                          # Facet the plot by "Churn" status (creates two subplots)
  theme_minimal()                                # Use a minimal theme for the plot

# Explicitly print the histogram plot
print(histogram_plot)

# ============================================================================================================
# Today's examples with explanatory comments, all are terminal scripts, tested and debugged (Version 2023.09.0+463):

# ============================================================================================================
# Correlation Heat Map Example:

# Load necessary libraries
library(corrplot)

# Script 1: Correlation Heatmap
# Generate a correlation heatmap to visualize numeric variable relationships

# Calculate the correlation matrix
cor_matrix <- cor(churn_data[, sapply(churn_data, is.numeric)])

# Create a correlation heatmap
corrplot(cor_matrix, method = "color", title = "Correlation Heatmap")

#============================================================================================================
#Pairwise Scatter Plot:

# Load necessary libraries for pairwise scatter plots
library(GGally)

# Create a subset of numeric variables for the scatter plot matrix
numeric_vars <- select_if(churn_data, is.numeric)

# Create a scatter plot matrix with adjusted alpha value
ggpairs(numeric_vars, title = "Pairwise Scatter Plot", aes(alpha = 0.03)) +
  theme_minimal()

# ============================================================================================================
#Bar Chart - Distribution of Churn
# Load necessary libraries for bar charts
library(ggplot2)

# Script 3: Bar Chart of Categorical Data
# Generate a bar chart to analyze categorical data (e.g., "Churn." distribution)

# Create a bar chart of Churn. distribution
ggplot(churn_data, aes(x = Churn.)) +
  geom_bar(fill = "blue") +
  labs(x = "Churn.", y = "Count") +
  ggtitle("Distribution of Churn.")

# ============================================================================================================
#Two Bar Charts - Not Normalized and Normalized

# Script 4: Bar Charts with Overlay for Normalized and Not Normalized Data
# Create bar charts with overlay for a specific categorical variable

# Subset the data for the categorical variable you want to analyze (e.g., "Area.Code" in this example)
categorical_variable <- "Area.Code"
subset_data <- churn_data

# Create a data frame to store the counts for the categorical variable
count_data <- data.frame(table(subset_data[[categorical_variable]]))

# Create a normalized version of the data
count_data$NormalizedCount <- count_data$Freq / sum(count_data$Freq)

# Create a bar chart for the not normalized data
p1 <- ggplot(count_data, aes(x = reorder(Var1, -Freq), y = Freq)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = categorical_variable, y = "Frequency") +
  ggtitle("Bar Chart (Not Normalized)")

# Create a bar chart for the normalized data
p2 <- ggplot(count_data, aes(x = reorder(Var1, -NormalizedCount), y = NormalizedCount)) +
  geom_bar(stat = "identity", fill = "green") +
  labs(x = categorical_variable, y = "Normalized Frequency") +
  ggtitle("Bar Chart (Normalized)")

# Print both plots side by side
gridExtra::grid.arrange(p1, p2, ncol = 2)

============================================================================================================
#Scatter Plot: Day Minutes VS Evening Minutes

# Create a scatter plot comparing "Day Minutes" and "Evening Minutes" with additional annotations

# Load the necessary libraries for data visualization
library(ggplot2)

# Create the base scatter plot using churn_data as the data source
ggplot(churn_data, aes(x = Day.Mins, y = Eve.Mins)) +

  # Add points to the scatter plot with color encoding based on the "Churn." variable
  geom_point(aes(color = Churn.)) +
  
  # Add a linear regression line to the scatter plot
  geom_smooth(method = "lm", se = FALSE) +
  
  # Set the x-axis label as "Day Minutes" and y-axis label as "Evening Minutes"
  labs(x = "Day Minutes", y = "Evening Minutes") +
  
  # Set the title of the plot
  ggtitle("Scatter Plot: Day Minutes vs. Evening Minutes") +
  
  # Customize the color scale manually, where "False." is represented in blue and "True." in red
  scale_color_manual(values = c("False." = "blue", "True." = "red")) +
  
  # Facet the plot by the "Churn." variable (creating separate plots for "False." and "True.")
  facet_wrap(~ Churn.) +
  
  # Use a minimal theme for the plot, removing unnecessary background elements
  theme_minimal()