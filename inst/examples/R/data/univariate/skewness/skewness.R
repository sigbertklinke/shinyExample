param <- function(k) {
  if (k<=0) return(c(4.97,5,5.03))
  return(c(k, k*(1-2/(9*k))^3, max(c(0,k-2))))
}

t <- (0:1000)/100
pdf("skewness.pdf", width=10, height=4)
par(mfrow=c(1,3), mar=c(0,0,0,0))
x <- t
y1 <- dchisq(x,3)
mean <- 3
median <- 3*(1-2/27)^3
mode <- 3-1
plot(x, y1, type="l", ylab="f(x)", axes=F)
abline(v=param(3), col=c("red", "blue", "green"), lwd=2)
box()
legend("topright", c("mean", "median", "mode"), col=c("red", "blue", "green"), lwd=2)
y3 <- dnorm(x, mean=5, sd=2)
plot(x, y3, type="l", ylab="f(x)", axes=F)
abline(v=param(0), col=c("red", "blue", "green"), lwd=2)
legend("topright", c("mean", "median", "mode"), col=c("red", "blue", "green"), lwd=2)
box()
plot(-x, y1, type="l", ylab="f(x)", axes=F)
abline(v=-param(3), col=c("red", "blue", "green"), lwd=2)
legend("topleft", c("mean", "median", "mode"), col=c("red", "blue", "green"), lwd=2)
box()
dev.off()