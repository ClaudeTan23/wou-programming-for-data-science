# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read dataset (update file path accordingly)
df <- read.csv("project_dataset.csv")

# 1️ Bar Chart: Average Salary by Department
df_avg_salary <- df %>%
  group_by(Department) %>%
  summarise(Average_Salary = mean(Salary, na.rm = TRUE))

ggplot(df_avg_salary, aes(x = Department, y = Average_Salary, fill = Department)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Salary by Department",
       x = "Department",
       y = "Average Salary") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# 2️ Scatter Plot: Age vs. Performance Score (Colored by Department)
ggplot(df, aes(x = Age, y = Performance_Score, color = Department)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Age vs. Performance Score",
       x = "Age",
       y = "Performance Score")

# 3️ Histogram: Distribution of Salary
ggplot(df, aes(x = Salary)) +
  geom_histogram(binwidth = 5000, fill = "blue", color = "black", alpha = 0.7) +
  theme_minimal() +
  labs(title = "Salary Distribution",
       x = "Salary",
       y = "Count")

# 4️ Line Plot: Salary over Employee ID
ggplot(df, aes(x = ID, y = Salary, group = 1)) +
  geom_line(color = "red") +
  theme_minimal() +
  labs(title = "Salary over Employee ID",
       x = "Employee ID",
       y = "Salary")
