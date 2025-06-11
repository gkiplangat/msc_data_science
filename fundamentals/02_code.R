# Compute summary statistics (mean, median, min, max, etc.) for all numerical variables (e.g., family_income, study_hours_weekly). 
# What insights do these provide about the data? 
# For numerical variables
summary(data %>% select_if(is.numeric))

