data(Boston, package="MASS")
# 
library("moments")
moments::kurtosis(Boston$medv) # kurtosis
# 
library("e1071")
e1071::kurtosis(Boston$medv)   # excess