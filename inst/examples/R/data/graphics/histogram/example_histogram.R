library("MASS") # for Boston Housing data
# histogram + observations
hist(Boston$medv)
rug(Boston$medv)
#
library("lattice")
histogram(~medv, data=Boston)
#
library("ggplot2")
ggplot(Boston, aes(x=medv)) + geom_histogram(binwidth=2)