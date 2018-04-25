library("MASS") # for Boston Housing data
library("lattice")
stripplot(~medv, data=Boston, jitter.data=T)