data(Boston, package="MASS")
library("nortest")
ad.test(Boston$medv)