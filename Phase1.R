# Load libraries
library(dplyr)

# Phase 1
# Import dataset
df <- read.csv("project_dataset.csv")
print(df)

# Check for missing values and remove rows with any NA
df <- na.omit(df)
print(df)

# Rename columns for consistency
df <- df %>%
  rename(
    Employee_ID = ID,
    Employee_Name = Name,
    Employee_Age = Age,
    Employee_Salary = Salary,
    Employee_Department = Department,
    Performance_Score = Performance_Score
  )
print(df)

# Filter rows where Employee_Salary > 50000
df_filtered <- df %>%
  filter(Employee_Salary > 50000)
print(df_filtered)

# Create a new column "Tax" (10% of Employee_Salary)
df_filtered <- df_filtered %>%
  mutate(Tax = Employee_Salary * 0.10)
print(df_filtered)

