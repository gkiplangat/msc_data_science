#Load the data set and display its structure (e.g., column names, data types, first few rows). 
#How many numerical and categorical variables are there? 

# Load the dataset
data <- read_csv("kenya_student_data.csv")


# Check if loaded properly
if(exists("data")) {
  print("Dataset loaded successfully!")
} else {
  print("Loading failed - check file name/path")
}

# View the structure of the data
glimpse(data)

# Display structure
str(data)
head(data)

# Count numerical vs categorical variables
num_vars <- sum(sapply(data, is.numeric))
cat_vars <- sum(sapply(data, is.character)) + sum(sapply(data, is.factor))

# Print the results
cat("Number of numerical variables:", num_vars, "\n")
cat("Number of categorical variables:", cat_vars, "\n")
