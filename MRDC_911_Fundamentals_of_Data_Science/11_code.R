# Load library
library(dplyr)

# Before imputation
hist(student_data$attendance_rate, 
     main = "Attendance Rate (Before Imputation)",
     xlab = "Attendance Rate")

# Impute missing values with mean
student_data <- student_data %>%
  mutate(
    attendance_rate = ifelse(is.na(attendance_rate), 
                             mean(attendance_rate, na.rm = TRUE), 
                             attendance_rate)
  )

# After imputation
hist(student_data$attendance_rate,
     main = "Attendance Rate (After Imputation)",
     xlab = "Attendance Rate")
