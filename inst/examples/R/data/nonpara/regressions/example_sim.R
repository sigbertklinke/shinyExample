# run example_lm2.R before
#
library("MASS")  # for Boston Housing data
library("np")
model <- npindex(medv~lstat+rm, data=Boston)
plotContour(model, Boston$lstat, Boston$rm, Boston$medv)
plot(model)