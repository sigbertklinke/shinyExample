library("MASS") # for Boston Housing data
fhat <- density(Boston$medv)
plot(fhat)