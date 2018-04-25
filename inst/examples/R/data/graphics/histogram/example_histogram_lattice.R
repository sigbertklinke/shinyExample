library("MASS") # for Boston Housing data
library("lattice")
histogram(~medv, data=Boston)