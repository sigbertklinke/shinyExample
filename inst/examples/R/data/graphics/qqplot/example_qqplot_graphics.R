library("MASS") # for Boston Housing data
qqnorm(Boston$medv, pch=19, cex=0.5)
qqline(Boston$medv)