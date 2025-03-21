# Phase 2
# Load library
library(dplyr)

# Import dataset (update the file path accordingly)
df <- read.csv("project_dataset.csv")

# Group data by Employee_Department and calculate the average salary
department_summary <- df %>%
  group_by(Department) %>%
  summarise(Average_Salary = mean(Salary, na.rm = TRUE))

print(department_summary)

# Sort dataset by Performance_Score in descending order
df_sorted <- df %>%
  arrange(desc(Performance_Score))

print(df_sorted)

# Extract specific columns: Employee_ID, Employee_Name, Employee_Department, and Employee_Salary
df_selected <- df %>%
  select(ID, Name, Department, Salary)

print(df_selected)

# Combine multiple operations using the pipe operator `%>%`
df_combined <- df %>%
  filter(Salary > 60000) %>% 
  select(ID, Name, Department, Salary, Performance_Score) %>%
  arrange(desc(Performance_Score))

print(df_combined)
