library("MASS") # for Boston Housing data
fhat <- density(Boston$medv)
plot(fhat)
#
library("lattice")
densityplot(~medv, data=Boston)
#
library("ggplot2")
ggplot(Boston, aes(x=medv)) + geom_density()