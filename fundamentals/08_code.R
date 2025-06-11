#Use a statistical test (e.g., chi-squared) to check if internet_access is associated with academic_performance.
# Interpret the results.

# Load required packages (stats is base R but shown for completeness)
library(stats)

# Perform chi-squared test of independence
chi_test <- chisq.test(
  student_data$internet_access, 
  student_data$academic_performance
)

# Print results
print(chi_test)


chi_test$observed   # Actual counts
chi_test$expected   # Expected counts if no association existed
