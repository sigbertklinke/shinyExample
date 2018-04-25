library("MASS")  # for Boston Housing data
# lattice
library("lattice")
xyplot(medv~lstat, data=Boston)