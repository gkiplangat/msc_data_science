explore_data <- function() {
  library(tidyverse)
  
  if (!file.exists("kenya_student_data.csv")) {
    cat("Error: 'kenya_student_data.csv' not found.\n")
    return(invisible())
  }
  
  student_data <- read_csv("kenya_student_data.csv")
  cat("Dataset loaded successfully!\n")
  
  # Rest of the function...
  cat("\n--- Structure with glimpse() ---\n")
  glimpse(student_data)
  
  cat("\n--- Structure with str() ---\n")
  str(student_data)
  
  cat("\n--- First few rows ---\n")
  print(head(student_data))
  
  num_vars <- sum(sapply(student_data, is.numeric))
  cat_vars <- sum(sapply(student_data, is.character)) + 
    sum(sapply(student_data, is.factor))
  
  cat("\nSUMMARY:\n")
  cat("Number of numerical variables:", num_vars, "\n")
  cat("Number of categorical variables:", cat_vars, "\n")
}
explore_data()
