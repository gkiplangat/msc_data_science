# Create boxplots of math_score by academic_performance and gender.
# What patterns do you observe? 

ggplot(data, aes(x = academic_performance, y = math_score, fill = gender)) +
  geom_boxplot() +
  labs(
    title = "Math Scores by Academic Performance and Gender",
    x = "Academic Performance",
    y = "Math Score",
    fill = "Gender"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")  # Optional: Color customization
