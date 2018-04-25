library("MASS") # for Boston Housing data
library("ggplot2")
ggplot(Boston, aes(x=medv)) + geom_histogram(binwidth=2)