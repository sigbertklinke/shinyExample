library("MASS") # for Boston Housing Data
library("car")
spreadLevelPlot(Boston$medv, by=Boston$rad)