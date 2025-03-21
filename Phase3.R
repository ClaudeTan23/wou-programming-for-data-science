# Load necessary libraries
library(dplyr)
library(ggplot2)

# Read dataset (update file path accordingly)
df <- read.csv("project_dataset.csv")

# 1️ Descriptive Statistics
# Measures of central tendency
mean_salary <- mean(df$Salary, na.rm = TRUE)
median_salary <- median(df$Salary, na.rm = TRUE)
mode_salary <- as.numeric(names(sort(table(df$Salary), decreasing = TRUE)[1]))

# Measures of dispersion
range_salary <- range(df$Salary, na.rm = TRUE)
variance_salary <- var(df$Salary, na.rm = TRUE)
std_dev_salary <- sd(df$Salary, na.rm = TRUE)

# Print results
cat("Mean Salary:", mean_salary, "\n")
cat("Median Salary:", median_salary, "\n")
cat("Mode Salary:", mode_salary, "\n")
cat("Range of Salary:", range_salary, "\n")
cat("Variance of Salary:", variance_salary, "\n")
cat("Standard Deviation of Salary:", std_dev_salary, "\n")

# 2️ Hypothesis Testing (t-test)
# Example: Testing if the average salary is significantly different from 50,000
t_test_result <- t.test(df$Salary, mu = 50000, na.rm = TRUE)
print(t_test_result)

# 3️ Linear Regression: Age vs. Salary
linear_model <- lm(Salary ~ Age, data = df)
summary(linear_model)