source("plotContour.R")
#
library("MASS")  # for Boston Housing data
library("np")
model <- npreg(medv~lstat+rm, data=Boston)
plotContour(model, Boston$lstat, Boston$rm, Boston$medv)
# do not run in examples
# plot(model)