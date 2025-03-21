# Load necessary libraries
library(dplyr)

# Read dataset (update file path accordingly)
df <- read.csv("project_dataset.csv")

# 1️ Function: Calculate Tax (10% of Salary)
calculate_tax <- function(salary) {
  return(salary * 0.10)  # 10% tax
}

# Apply the function to create a new 'Tax' column
df <- df %>%
  mutate(Tax = calculate_tax(Salary))

print(df)

# 2️ Function: Categorize Employees into Performance Tiers
categorize_performance <- function(score) {
  if (score >= 90) {
    return("High Performer")
  } else if (score >= 80) {
    return("Average Performer")
  } else {
    return("Low Performer")
  }
}

# Apply the function to create a new 'Performance_Tier' column
df <- df %>%
  mutate(Performance_Tier = sapply(Performance_Score, categorize_performance))

print(df)

# 3️ Utility Function: Generate Summary Statistics for Any Numerical Column
generate_summary <- function(column) {
  stats <- list(
    Mean = mean(column, na.rm = TRUE),
    Median = median(column, na.rm = TRUE),
    Mode = as.numeric(names(sort(table(column), decreasing = TRUE)[1])), # Mode calculation
    Min = min(column, na.rm = TRUE),
    Max = max(column, na.rm = TRUE),
    Range = max(column, na.rm = TRUE) - min(column, na.rm = TRUE),
    Variance = var(column, na.rm = TRUE),
    Standard_Deviation = sd(column, na.rm = TRUE)
  )
  return(stats)
}

summary_salary <- generate_summary(df$Salary)

print(summary_salary)
