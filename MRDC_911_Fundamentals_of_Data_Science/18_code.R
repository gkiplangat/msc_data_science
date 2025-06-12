# Load Libraries
library(ggplot2)
library(dplyr)

# Create scatter plot
ggplot(student_data, aes(x = study_hours_weekly, y = total_score, color = residency)) +
  geom_point(alpha = 0.7) +  
  geom_smooth(method = "lm", se = FALSE) +  
  labs(
    title = "Study Hours vs Academic Performance by Residency",
    x = "Weekly Study Hours",
    y = "Average Academic Score",
    color = "Residency"
  ) +
  theme_minimal()

# Calculate correlation by residency
correlation_by_residency <- student_data %>%
  group_by(residency) %>%
  summarise(
    correlation = cor(study_hours_weekly, total_score, 
                      use = "complete.obs", method = "pearson")
  )
print(correlation_by_residency)

