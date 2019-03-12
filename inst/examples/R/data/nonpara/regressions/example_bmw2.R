# run example_lm2.R before
#
data(Boston, package="MASS")
library("np")
data(Boston, package="MASS")
par(mfrow=c(1,1))
plotContour(model, Boston$lstat, Boston$rm, Boston$medv)
par(mfrow=c(2,2))
plot(model)
