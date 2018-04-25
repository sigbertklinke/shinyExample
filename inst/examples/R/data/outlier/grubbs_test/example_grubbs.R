library("MASS")  # for Boston Housing data
library("outliers")
grubbs.test(Boston$medv)
grubbs.test(Boston$medv, opposite=T)