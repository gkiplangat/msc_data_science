# Create boxplots of math_score by academic_performance and gender.
# What patterns do you observe? 
library(ggplot2) #Place cursor here and click run
library(dplyr) #Place cursor here and click run

ggplot(student_data, aes(x = academic_performance, y = math_score, fill = gender)) +
  geom_boxplot() +
  labs(
    title = "Math Scores by Academic Performance and Gender",
    x = "Academic Performance",
    y = "Math Score",
    fill = "Gender"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")  #Place cursor here and click run
