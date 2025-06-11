#Load libraries
library(corrplot) #Place cursor here and click run
library(ggplot2) #Place cursor here and click run
library(dplyr) #Place cursor here and click run

# Select numerical variables (with more robust checking)
num_data <- student_data %>%
  select(where(is.numeric)) %>%
  select(-student_id)  #Place cursor here and click run

# Check if we have enough numerical variables
if(ncol(num_data) < 2) {
  stop("Insufficient numerical variables for correlation analysis (need at least 2)")
}#Place cursor here and click run

# Create correlation matrix with pairwise complete observations
cor_matrix <- cor(num_data, use = "pairwise.complete.obs")

# Enhanced visualization
corrplot(cor_matrix, 
         method = "color",
         type = "upper",
         order = "hclust",
         tl.col = "black",
         tl.srt = 45,
         addCoef.col = "black",
         number.cex = 0.7,
         title = "Correlation Matrix of Numerical Variables",
         mar = c(0, 0, 1, 0)) #Place cursor here and click run
