#Load library
library(tidyverse)

# Define the function
analyze_student_data <- function() {
  # Load data
  student_data <- read_csv("kenya_student_data.csv")
  
  # Analysis with clear output
  cat("\n=== Extracurricular Activities ===\n")
  print(prop.table(table(student_data$extracurricular_activities)))
  
  cat("\n=== Faculty Distribution ===\n")
  print(prop.table(table(student_data$faculty)))
}

# execute it
analyze_student_data()

