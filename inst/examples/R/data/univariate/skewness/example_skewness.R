data(Boston, package="MASS")
# 
library("moments")
skewness(Boston$medv)
# 
library("e1071")
skewness(Boston$medv)