sign.test <- function(x, theta0=mean(x), ...) {
  ntie <- sum(x==theta0)
  nlow <- sum(x<theta0)
  nupp <- sum(x>theta0)
  if (nlow<nupp) nlow <- nlow+ntie 
  binom.test(nlow, length(x), p=0.5, ...)
}

data(Boston, package="MASS")
# Sign test 
# H0: median(medv) = mean(medv) 
# H1: median(medv) <> mean(medv) 
sign.test(Boston$medv)