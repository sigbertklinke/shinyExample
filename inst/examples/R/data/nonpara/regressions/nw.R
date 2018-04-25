grid1 <- function (x, n=500) {
  r <- range(x)
  return (r[1]+diff(r)*(0:n)/n)
}

dop <- T
library("foreign")
library("np")

x <- read.spss("BOSTONH.SAV")
xn <- data.frame(LSTAT=grid1(x$LSTAT))
if (dop) { pdf("nw.pdf", width=10, height=6) }
plot(x$LSTAT, x$MEDV, cex=0.5, xlab="Percentage of lower status people", ylab="Median house prices")

nw1 <- npreg(MEDV~LSTAT, data=x)
yh  <- predict(nw1, newdata=xn)
lines(xn$LSTAT, yh, lwd=2)

nw2 <- npreg(MEDV~LSTAT, data=x, bws=5*nw1$bw)
yh  <- predict(nw2, newdata=xn)
lines(xn$LSTAT, yh, lwd=2, col="green")

nw3 <- npreg(MEDV~LSTAT, data=x, bws=2.5*nw1$bw)
yh  <- predict(nw3, newdata=xn)
lines(xn$LSTAT, yh, lwd=2, col="blue")

nw4 <- npreg(MEDV~LSTAT, data=x, bws=0.5*nw1$bw)
yh  <- predict(nw4, newdata=xn)
lines(xn$LSTAT, yh, lwd=2, col="red")

legend("topright", legend=sprintf("h=%.3f", c(nw4$bw, nw1$bw, nw3$bw, nw2$bw)), col=c("red", "black", "blue", "green"), lwd=2)
if (dop) { dev.off() }