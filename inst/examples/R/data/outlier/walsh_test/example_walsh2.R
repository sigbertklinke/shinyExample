walsh.test <- function(x, alternative="less", r=1, verbose=FALSE, alpha, na.rm=FALSE) {
	fn <- function(alpha, x, c, r) {
		b   <- 1/sqrt(alpha)
		if (c-b*b<0) return(1)
		a   <- (1+b*sqrt((c-b*b)/(c-1)))/(c-b*b-1)
		if (a<=0) return(1)
		l   <- x[1]-(1+a)*x[2]+a*x[3]
    return(l*l)
	}
  xs  <- if (na.rm) sort(x[!is.na(x)]) else  sort(x)  	
  n   <- length(xs)
	c   <- floor(sqrt(2*n))
	b   <- 1/sqrt(alpha)
	if (c-b*b<0) stop('"A" must be positive, enlarge n')
	
	a   <- (1+b*sqrt((c-b*b)/(c-1)))/(c-b*b-1)
	if (a<=0) stop('"A" must be positive, enlarge alpha or n')
	l <- rejectH0 <- NA
	apt <- pmatch(alternative, c("less", "greater")) 
	if (apt==1) {
    if (verbose) print(sprintf('X(%.0f)-%.3fX(%.0f)+%.3fX(%.0f)', r, 1+a, r+1, a,  r+c))
		l <- xs[r]-(1+a)*xs[r+1]+a*xs[r+c]
		p <- optimize(fn, c(0,1), x=c(xs[r], xs[r+1], xs[r+c]), c=c, r=r)
		reject <- (l<0)
  }
  if (apt==2) {
		if (verbose) print(sprintf('X(%.0f)-%.3fX(%.0f)+%.3fX(%.0f)', n-r+1, 1+a, n-r, a, n+1-r-c))
		l <- xs[n-r+1]-(1+a)*xs[n-r]+a*xs[n+1-r-c]
		p <- optimize(fn, c(0,1), x=c(xs[n-r+1], xs[n-r], xs[n+1-r-c]), c=c, r=r)
		reject <- (l>0)
	}
	list(statistic=l, rejectH0=reject, p.value=p$minimum)
}

x <- c(2,2,runif(73))
walsh.test(x, r=2, alpha=0.1, verbose=TRUE)
walsh.test(x, r=2, alpha=0.1, alternative="g", verbose=TRUE)