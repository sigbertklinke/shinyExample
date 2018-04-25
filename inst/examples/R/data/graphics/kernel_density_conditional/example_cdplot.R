library("MASS") # for Boston Housing data
cdplot(Boston$medv, factor(Boston$chas))