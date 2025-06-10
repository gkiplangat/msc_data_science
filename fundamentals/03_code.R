# Create a bar plot to visualize the distribution of academic_performance. 
#Is the target variable balanced across its classes (Poor, Average, Good, Excellent)? 


ggplot(data, aes(x = academic_performance)) +
  geom_bar() +
  labs(title = "Distribution of Academic Performance")

# Check if balanced
table(student_data$academic_performance)
