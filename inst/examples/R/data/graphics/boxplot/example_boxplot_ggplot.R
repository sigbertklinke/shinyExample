library("MASS") # for Boston Housing data
library("ggplot2")
ggplot(Boston, aes(x=factor(rad), y=medv)) + geom_boxplot() 