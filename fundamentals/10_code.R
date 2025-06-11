# Impute missing values in family_income and math_score using the median. 
# Justify why the median is appropriate for these variables.

# Load required package
library(dplyr)

# Median imputation
student_data <- student_data %>%
  mutate(
    family_income = ifelse(is.na(family_income), 
                           median(family_income, na.rm = TRUE), 
                           family_income),
    math_score = ifelse(is.na(math_score), 
                        median(math_score, na.rm = TRUE), 
                        math_score)
  )
