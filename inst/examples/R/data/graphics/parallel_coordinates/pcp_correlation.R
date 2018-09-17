library("MASS")
n <- 10
r <- sample(-25:25, 1)/25
repeat {
  x <- mvrnorm(n=n, mu=c(0,0), Sigma=matrix(c(1,r,r,1), ncol=2))
  if (abs(r-cor(x)[1,2])<0.01) break
}
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