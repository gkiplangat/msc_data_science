analyze_performance <- function(student_data) {
  # Load libraries
  suppressPackageStartupMessages({
    library(ggplot2)
    library(dplyr)
  })
  
  # Check if the required column exists
  if (!"academic_performance" %in% names(student_data)) {
    stop("Error: 'academic_performance' column not found in the dataset.")
  }
  
  # Plot distribution
  p <- ggplot(student_data, aes(x = academic_performance)) +
    geom_bar(fill = "steelblue", alpha = 0.8) +
    labs(
      title = "Distribution of Academic Performance",
      x = "Academic Performance",
      y = "Count"
    ) +
    theme_minimal()
  
  # Print plot
  print(p)
  
  # Check class balance
  cat("\n--- Class Balance Check ---\n")
  freq_table <- table(student_data$academic_performance)
  print(freq_table)
  
  # Add proportions for clarity
  cat("\nProportions (%):\n")
  print(round(prop.table(freq_table) * 100, 1))
} 

# First load your data
student_data <- read_csv("kenya_student_data.csv")

# run the analysis
analyze_performance(student_data) 

