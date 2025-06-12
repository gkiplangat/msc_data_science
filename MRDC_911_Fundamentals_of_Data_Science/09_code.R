# Identify columns with missing values
colSums(is.na(student_data))

# Calculate percentages
colMeans(is.na(student_data)) * 100
