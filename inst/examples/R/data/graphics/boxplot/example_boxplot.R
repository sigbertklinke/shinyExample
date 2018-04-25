library("MASS") # for Boston Housing data
boxplot(medv~rad, data=Boston)
#
library("lattice")
bwplot(~medv|rad, data=Boston)
#
library("ggplot2")
ggplot(Boston, aes(x=factor(rad), y=medv)) + geom_boxplot() 