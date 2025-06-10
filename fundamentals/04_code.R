# Visualize the distribution of study_hours_weekly using a histogram.
# How does it vary between urban and rural students (use a faceted histogram)?


# Load data (replace "your_data.csv" with your file)
data <- read.csv("your_data.csv")  

# Check column names (ensure "study_hours_weekly" and "residency" exist)
head(data)
# Filter out invalid values and create 'clean_data'
clean_data <- data %>% 
  filter(study_hours_weekly >= 0,  # Remove negative study hours
         residency %in% c("Rural", "Urban"))  # Ensure only these groups exist

# Create faceted histogram
ggplot(clean_data, aes(x = study_hours_weekly, fill = residency)) +
  geom_histogram(binwidth = 2, color = "white", alpha = 0.7) +  # Adjust binwidth as needed
  facet_wrap(~residency, ncol = 1) +  # Vertical facets for Rural/Urban
  labs(
    title = "Distribution of Weekly Study Hours by Residency",
    x = "Weekly Study Hours",
    y = "Count",
    fill = "Residency"
  ) +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1")  # Optional: Color customization

