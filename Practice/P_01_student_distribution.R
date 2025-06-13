library(ggplot2)
st_data <- read.csv("student_habits_performance.csv")

str(st_data)

ggplot(st_data, aes(x = gender)) +
  geom_bar(fill = "maroon", color = "red") +
  labs(
    x = "Gender (Male or Female)", 
    y = "Number of Students",
    title = "Student Gender Distribution"
  )
