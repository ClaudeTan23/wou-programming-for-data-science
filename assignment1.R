##Task 1.1. Load the dataset into R and print the first 5 rows.
dataset <- read.csv("./sample_assignment_dataset assignment 1.csv")   ## - `read.csv()` reads the dataset from a CSV file.
print(head(dataset, 5))   ## - `head()` displays the first 5 rows to inspect data structure.

##Task 1.2. Display the structure of the dataset and summarize its contents.
str(dataset)  ## - `str()` provides an overview of data types and structure.
summary(dataset)  ## - `summary()` gives descriptive statistics for numerical and categorical variables.

##Task 1.3. Create a new column called `Tax` which is 10% of the `Salary` column.
## - This simulates a tax deduction by multiplying each salary by 0.10.
dataset$Tax <- dataset$Salary * 0.10

##Task 1.4. Save the modified dataset as a new CSV file.
write.csv(dataset, "modified_dataset.csv")  ## - `write.csv()` exports the dataset with the new `Tax` column.

##Task 2.1. Create a vector of all `Age` values from the dataset and calculate the mean age.
age_vector <- dataset$Age
mean_age <- mean(age_vector, na.rm = TRUE)  ## - `mean()` calculates the average while `na.rm = TRUE` ignores missing values.
print(mean_age)

##Task 2.2. Extract all rows where the `Department` is "IT" and save it as a new data frame.
it_department <- subset(dataset, Department == "IT")  ## - `subset()` filters the dataset based on the condition.

##Task 2.3. Create a matrix containing the `ID`, `Age`, and `Salary` columns.
employee_matrix <- as.matrix(dataset[, c("ID", "Age", "Salary")]) ## - `as.matrix()` converts selected columns into a matrix format.

##Task 2.4. Create a list containing:
##- The original dataset.
##- A vector of `Department` names.
##- A matrix of the first three rows of the dataset.
data_list <- list(
  OriginalDataset = dataset,
  DepartmentNames = unique(dataset$Department),
  FirstThreeRows = as.matrix(dataset[1:3, ])
)

##Task 3.1. Write a function that categorizes employees into "Senior" or "Junior" based on an `Age` threshold of 35. Apply this function to the dataset and add the results as a new column.
## - `sapply()` applies the function to each row in the `Age` column.
categorize_employee <- function(age) {
  if (age > 35) {
    return("Senior")
  } else {
    return("Junior")
  }
}
dataset$Category <- sapply(dataset$Age, categorize_employee)

##Task 3.2. Use a `for` loop to print the name of each employee and their department.
## - Iterates through all rows, printing employee details with `cat()`.
for (i in 1:nrow(dataset)) {
  cat("Employee:", dataset$Name[i], ",  Department:", dataset$Department[i], "\n")
}

##Task 3.3. Use a `while` loop to calculate the cumulative sum of `Salary` values until it exceeds 150,000.
## - Loops through salaries, adding them up until the total surpasses 150,000.
total_salary <- 0
i <- 1
while (total_salary <= 150000 && i <= nrow(dataset)) {
  total_salary <- total_salary + dataset$Salary[i]
  i <- i + 1
}
print(total_salary)

##Task 3.4. Use an `if-else` statement to identify if any employee has a `Salary` greater than 85,000 and print their details.
## - `subset()` extracts employees with `Salary` > 85,000.
high_salary <- subset(dataset, Salary > 85000)
if (nrow(high_salary) > 0) {
  print("Employees with Salary > 85,000:")
  print(high_salary)
} else {
  print("No employees have a Salary greater than 85,000.")
}
