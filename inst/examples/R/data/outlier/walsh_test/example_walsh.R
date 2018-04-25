walsh.test <- function(x, alternative="less", r=1, verbose=FALSE, alpha, na.rm=FALSE) {
  xs  <- if (na.rm) sort(x[!is.na(x)]) else  sort(x)  	
  n   <- length(xs)
	c   <- floor(sqrt(2*n))
	b   <- 1/sqrt(alpha)
	a   <- (1+b*sqrt((c-b*b)/(c-1)))/(c-b*b-1)
	if (a<=0) stop('"A" must be positive, maybe you can enlage alpha')
	l <- rejectH0 <- NA
	apt <- pmatch(alternative, c("less", "greater")) 
	if (apt==1) {
    if (verbose) print(sprintf('X(%.0f)-%.3fX(%.0f)+%.3fX(%.0f)', r, 1+a, r+1, a,  r+c))
		l <- xs[r]-(1+a)*xs[r+1]+a*xs[r+c]
		reject <- (l<0)
  }
  if (apt==2) {
		if (verbose) print(sprintf('X(%.0f)-%.3fX(%.0f)+%.3fX(%.0f)', n-r+1, 1+a, n-r, a, n+1-r-c))
		l <- xs[n-r+1]-(1+a)*xs[n-r]+a*xs[n+1-r-c]
		reject <- (l>0)
	}
	list(statistic=l, rejectH0=reject)
}

x <- runif(75)
walsh.test(x, r=2, alpha=0.1, verbose=TRUE)
walsh.test(x, r=2, alpha=0.1, alternative="g", verbose=TRUE)