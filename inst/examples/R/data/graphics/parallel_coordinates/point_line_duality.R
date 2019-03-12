n  <- 10
repeat {
	# create data points on a line
	x <- 2*runif(2)-1
	y <- 2*runif(2)-1
	fit <- lm(y~x)
	c   <- coef(fit)
	x1  <- rnorm(n)
	x2  <- c[1]+c[2]*x1
#	pdf("point_line_duality.pdf", width=10, height=5)
	par(mfrow=c(1,2))
  plot(0,0, xlim=c(0,1), ylim=c(-3,3), type="n", main="Parallel coordinate plot", axes=F, xlab="", ylab="")
  if (c[2]<0) points(-1/(c[2]-1), -c[1]/(c[2]-1), col="red", pch=19, cex=2)
  axis(1, at=c(0,1), labels=c("x1", "x2"))
  axis(2)
  box()
  abline(v=c(0,1))
  for (i in 1:n) lines(c(0,1), c(x1[i], x2[i]))
  plot(x1, x2, xlim=c(-3,3), ylim=c(-3,3), main="Scatterplot", pch=19, cex=2)
  abline(fit, col="red")
#  dev.off()
  Sys.sleep(1)
}
