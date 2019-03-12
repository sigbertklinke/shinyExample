library("MASS")
n <- 30
r <- -1
dr <- 0.02
repeat {
  r <- r+dr
  if (r<=-1) { r<- -1; dr <- +0.02}
  if (r>=+1) { r<- +1; dr <- -0.02}
  repeat {
  	x <- mvrnorm(n=n, mu=c(0,0), Sigma=matrix(c(1,r,r,1), ncol=2))
  	if (abs(r-cor(x)[1,2])<0.02) break
  }
#  pdf("pcp_correlation.pdf", width=10, height=5)
	par(mfrow=c(1,2))
  plot(0, 0, type="n", xlim=c(0,1), ylim=c(-3,3), axes=F, main="Parallel coordinate plot", 
  		 xlab="", ylab="")
  abline(v=c(0,1))
  for (i in 1:n) lines(c(0,1), x[i,])
  axis(1, at=c(0,1), labels=c("x1", "x2"))
  axis(2)
  box()
	plot(x, pch=19, xlim=c(-3,3), ylim=c(-3,3), asp=T, xlab="x1", ylab="x2", 
			 main="Scatterplot", sub=sprintf("r = %.2f", cor(x)[1,2]))
#	dev.off()
	Sys.sleep(1)
}