library("MASS") # for Boston Housing data
library("lattice")
bwplot(~medv|rad, data=Boston)