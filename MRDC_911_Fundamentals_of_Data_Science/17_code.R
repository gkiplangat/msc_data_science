#Load Libraries
library(dplyr)

# Create contingency table
activity_performance_table <- table(
  extracurricular = student_data$extracurricular_activities,
  performance = student_data$academic_performance
)

# Create AND print the proportion table
print("Row Proportions (%):")
(prop_table <- prop.table(activity_performance_table, margin = 1) * 100)

# Visualize with mosaic plot
mosaicplot(activity_performance_table,
           main = "Extracurricular Activities vs Academic Performance",
           xlab = "Extracurricular Activities",
           ylab = "Academic Performance",
           color = c("lightblue", "lightgreen", "salmon", "gold"),
           cex.axis = 0.5)

# Statistical significance test
(chisq_test <- chisq.test(activity_performance_table))
