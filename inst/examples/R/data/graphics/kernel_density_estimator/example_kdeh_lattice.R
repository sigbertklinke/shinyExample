library("MASS") # for Boston Housing data
library("lattice")
densityplot(~medv, data=Boston, bw=0.7)