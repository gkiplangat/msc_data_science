# calculate quartiles and bounds
Q1 <- quantile(student_data$family_income, 0.25, na.rm = TRUE)
Q3 <- quantile(student_data$family_income, 0.75, na.rm = TRUE)
IQR <- Q3 - Q1
lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR
outliers <- sum(student_data$family_income < lower_bound | student_data$family_income > upper_bound, na.rm = TRUE)

# create the 'results' list
results <- list(
  Q1 = Q1,
  Q3 = Q3,
  IQR = IQR,
  lower_bound = lower_bound,
  upper_bound = upper_bound,
  outliers = outliers
)

# print it
print(results)
