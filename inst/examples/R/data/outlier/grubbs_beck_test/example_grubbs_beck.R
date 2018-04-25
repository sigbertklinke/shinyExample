grubbs.beck.test <- function (x, left=T, B=1000, k=2) {
  gbs <- function(sx, ind) { var(sx[ind])/var(sx) }
  #
  n <- length(x)
  if (left) ind<-(k+1):n else ind<-1:(n-k)
  vb <- replicate(B, gbs(sort(rnorm(n)), ind))
  v  <- gbs(sort(scale(x)), ind=ind)
  list(statistic=(n-3)/(n-1)*v, p.value=sum(vb<=v)/B)
}
#
library("MASS")  # for Boston Housing data
library("outliers")
x <- Boston$medv[sample(506, 20)]
grubbs.test(x, type=20)
#
grubbs.beck.test(Boston$medv, left=F)