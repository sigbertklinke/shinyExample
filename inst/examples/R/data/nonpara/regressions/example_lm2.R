source("plotContour.R")
#
library("MASS")  # for Boston Housing data
model <- lm(medv~lstat+rm, data=Boston)
plotContour(model, Boston$lstat, Boston$rm, Boston$medv)
plot(model)