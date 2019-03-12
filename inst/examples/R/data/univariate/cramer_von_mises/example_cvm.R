data(Boston, package="MASS")
library("nortest")
cvm.test(Boston$medv)