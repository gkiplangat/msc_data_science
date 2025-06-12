# Load required library
library(dplyr)

# Cap the outliers at the IQR bounds
student_data <- student_data %>%
  mutate(
    family_income_capped = ifelse(family_income < lower_bound, lower_bound,
                                  ifelse(family_income > upper_bound, upper_bound, family_income))
  )

# Create side-by-side boxplots to compare before and after capping
boxplot(student_data$family_income, student_data$family_income_capped,
        names = c("Original", "Capped"),
        main = "Family Income Distribution Before and After Capping",
        ylab = "Family Income",
        col = c("lightblue", "lightgreen"))
