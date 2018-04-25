library("MASS") # for Boston Housing dat
Boston$lstat <- 2*round(Boston$lstat/2)
Boston$medv  <- 2*round(Boston$medv/2)
sunflowerplot(medv~lstat, data=Boston)