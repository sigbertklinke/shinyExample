library("MASS") # for Boston Housing data
library("scatterplot3d")
scatterplot3d(Boston$rm, Boston$lstat, Boston$medv)