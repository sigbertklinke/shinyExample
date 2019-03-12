data(Boston, package="MASS")
ecdf.medv <- ecdf(Boston$medv)
# print
ecdf.medv
# summary
summary(ecdf.medv)
# plot
plot(ecdf.medv)