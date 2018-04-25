library("MASS") # for Boston Housing data
stem(Boston$medv)
stem(Boston$medv, scale=0.5)

library("aplpack")
stem.leaf(Boston$medv)