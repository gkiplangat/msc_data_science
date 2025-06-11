# Identify columns with missing values and report their percentages.
# Why might these variables have missing data in a Kenyan context? 

# Identify columns with missing values
colSums(is.na(student_data))

# Calculate percentages
colMeans(is.na(student_data)) * 100

# Kenyan context interpretation: Missing data might reflect reporting issues,
# especially for sensitive information like family income in some communities.