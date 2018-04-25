library("MASS") # for Boston Housing data
fhat <- density(Boston$medv, bw=0.7)
plot(fhat)