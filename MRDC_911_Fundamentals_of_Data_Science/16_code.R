# Load required libraries
library(dplyr)
library(ggplot2)

# Create total_score
student_data <- student_data %>%
  mutate(
    total_score = (math_score + science_score + english_score) / 3
  )

# Visualize distribution
# Histogram with density curve
ggplot(student_data, aes(x = total_score)) +
  geom_histogram(aes(y = ..density..), 
                 bins = 30, 
                 fill = "lightgreen", 
                 color = "black") +
  geom_density(alpha = 0.2, fill = "red") +
  labs(
    title = "Distribution of Academic Performance",
    x = "Average Score",
    y = "Density"
  )
