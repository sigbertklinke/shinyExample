library("MASS")      # for Boston Housing data
attach(Boston)
medv
medv <- rep(NA, 506) 
medv                 # medv changed
str(Boston)          # Boston$medv not changed