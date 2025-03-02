# Load libraries
library(dplyr)
library(ggplot2)

# Load dataset
df <- read.csv("assignment2_dataset.csv")

# Task 1.1
# Function to calculate tax
calculate_tax <- function(salary) {
  return(salary * 0.10)
}

df$Tax <- calculate_tax(df$Salary)

print("Task 1.1 calculate_tax function to calculate 10% tax and add Tax column to the dataset")
print(df)


# Task 1.2
# Function to categorize performance
categorize_performance <- function(score) {
  if (score > 90) {
    return("High Performer")
  } else if (score >= 80 & score <= 90) {
    return("Average Performer")
  } else {
    return("Low Performer")
  }
}

df$Performance_Category <- sapply(df$Performance_Score, categorize_performance)

print("Task 1.2 categorize_performance function to categorize employees and add Performance_Category")
print(df)


# Task 2.1
# Data Manipulation
df_filtered <- dplyr::filter(df, Salary > 60000)
print("Task 2.1 Use filter() to extract rows where Salary > 60,000")
print(df_filtered)


# Task 2.2
df_mutate <- dplyr::mutate(df, Bonus = Salary * 0.05)
print("Task 2.2 Use mutate() to create Bonus column as 5% of Salary")
print(df_mutate)


# Task 2.3
df_sorted <- dplyr::arrange(df, desc(Performance_Score))
print("Task 2.3 Use arrange() to sort the dataset by Performance_Score in descending order")
print(df_sorted)


# Task 2.4
df_avg_salary <- dplyr::group_by(df, Department) %>% dplyr::summarize(Average_Salary = mean(Salary))
print("Task 2.4 Use group_by() and summarize() to calculate the average Salary for each Department")
print(df_avg_salary)


# Task 3.1  
# Data Visualization
# Bar chart for average salary per department
ggplot(df_avg_salary, aes(x = Department, y = Average_Salary)) + 
  geom_bar(stat = "identity", fill = "steelblue") + 
  theme_minimal() + 
  labs(title = "Average Salary by Department", x = "Department", y = "Average Salary")


# Task 3.2
# Scatter plot of Age vs Performance Score
ggplot(df, aes(x = Age, y = Performance_Score, color = Department)) + 
  geom_point(size = 3) + 
  theme_minimal() + 
  labs(title = "Age vs Performance Score", x = "Age", y = "Performance Score")


# Task 3.3
# Histogram of Salary
ggplot(df, aes(x = Salary)) + 
  geom_histogram(binwidth = 5000, fill = "blue", color = "black", alpha = 0.7) + 
  theme_minimal() + 
  labs(title = "Salary Distribution", x = "Salary", y = "Count")


# Task 3.4
# Line plot of Salary over ID
ggplot(df, aes(x = ID, y = Salary)) + 
  geom_line(color = "red") + 
  geom_point() +
  theme_minimal() + 
  labs(title = "Salary Trend by ID", x = "Employee ID", y = "Salary")
  