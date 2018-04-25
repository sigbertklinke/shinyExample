library("MASS") # for Boston Housing data
library("ggplot2")
d <- ggplot(Boston, aes(sample=medv)) + stat_qq() 
d + geom_abline(intercept = mean(Boston$medv), 
                slope = sd(Boston$medv))