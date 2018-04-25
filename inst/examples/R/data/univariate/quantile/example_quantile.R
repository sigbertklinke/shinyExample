percentile.rank <- function (x, type=7) {
  k <- order(x)
  n <- length(x)
  if (type==7) return((k-1)/(n-1))
  if (type==4) return(k/n)
  if (type==5) return((k-0.5)/n)
  if (type==6) return(k/(n+1))
  if (type==8) return((k-1/3)/(n+1/3))
  if (type==9) return((k-3/8)/(n+1/4))
  stop("unknown or uncomputable type")
}

x <- sort(runif(10))
quantile(x)
cbind(x, percentile.rank(x, type=9))