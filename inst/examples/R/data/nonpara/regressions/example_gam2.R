# run example_lm2.R before
#
library("MASS")  # for Boston Housing data
library("mgcv")
model <- gam(medv~s(lstat)+s(rm), data=Boston)
plotContour(model, Boston$lstat, Boston$rm, Boston$medv)
plot(model)