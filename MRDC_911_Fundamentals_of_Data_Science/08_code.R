# Load libary
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
