library("MASS")    # for Boston Housing data
# mean
mean(Boston$medv)
# median
median(Boston$medv)
# mode, see http://stackoverflow.com/questions/2547402
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
Mode(Boston$rad)