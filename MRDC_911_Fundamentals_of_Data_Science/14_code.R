# Load required libraries
library(dplyr)
library(ggplot2)


# Discretize study_hours_weekly
student_data <- student_data %>%
  mutate(
    study_hours_binned = cut(
      study_hours_weekly,
      breaks = quantile(study_hours_weekly, probs = seq(0, 1, 0.25), na.rm = TRUE),
      labels = c("Low", "Moderate", "High", "Very High"),
      include.lowest = TRUE  
    )
  )

# Create bar plot
library(ggplot2)
ggplot(student_data, aes(x = study_hours_binned)) +
  geom_bar(fill = "steelblue", color = "black") +
  labs(
    title = "Distribution of Study Hours",
    x = "Study Hours Category",
    y = "Number of Students"
  ) +
  theme_minimal()
