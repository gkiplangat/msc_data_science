# Load required libraries
library(dplyr)  
library(ggplot2)  
library(psych)


#Discretize family_income
student_data <- student_data %>%
  mutate(
    income_binned = cut(
      family_income,
      breaks = quantile(family_income, probs = seq(0, 1, 0.25), na.rm = TRUE),
      labels = c("Low", "Medium-Low", "Medium-High", "High"),
      include.lowest = TRUE
    )
  )

# Create total_score
student_data <- student_data %>%
  mutate(
    total_score = (math_score + science_score + english_score) / 3
  )

# Boxplot visualization
ggplot(student_data, aes(x = income_binned, y = total_score)) +
  geom_boxplot(fill = "goldenrod") +
  labs(
    title = "Academic Performance by Income Level",
    x = "Income Category",
    y = "Average Academic Score"
  )

# Statistical correlation (ordinal)
corr_test <- corr.test(
  as.numeric(student_data$income_binned),  # Convert to ordinal
  student_data$total_score,
  method = "spearman"  # Non-parametric correlation
)
print(corr_test$r)  #Correlation coefficient
