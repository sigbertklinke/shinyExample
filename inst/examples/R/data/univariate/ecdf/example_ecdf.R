library("MASS") # for Boston Housing data
ecdf.medv <- ecdf(Boston$medv)
# print
ecdf.medv
# summary
summary(ecdf.medv)
# plot
plot(ecdf.medv)