# Load library 
library(tidyverse)

# Load data (replace "your_data.csv" with your file)
student_data <- read.csv("kenya_student_data.csv")  

# Check column names "study_hours_weekly" and "residency" exist
head(data)

# Filter out invalid values and create 'clean_data'
clean_data <- data %>% 
  filter(study_hours_weekly >= 0, 
         residency %in% c("Rural", "Urban")) 

# Create faceted histogram
ggplot(clean_data, aes(x = study_hours_weekly, fill = residency)) +
  geom_histogram(binwidth = 2, color = "white", alpha = 0.7) +  
  facet_wrap(~residency, ncol = 1) +
  labs(
    title = "Distribution of Weekly Study Hours by Residency",
    x = "Weekly Study Hours",
    y = "Count",
    fill = "Residency"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")

