set.seed(910164)
x  <- 0.5+rnorm(20)
sx <- sort(x)
ix <- which.min((sx-0.5)^2)

pdf("qqpp_idea.pdf", width=10, height=7)
## QQ plot
par(mfrow=c(2,3))
fh <- ecdf(x)
plot(ecdf(x), main="Empirical distribution function")
usr <- par("usr")
xt <- sx[ix]
f0 <- fh(xt)
lines(c(xt,xt), c(0, f0), lty="dashed")
lines(c(xt, usr[2]), c(f0, f0), lty="dashed")
text(usr[2]*0.95, f0, pos=3, "q")

x0 <- (-300:300)/100
plot(x0, pnorm(x0), type="l", xlim=usr[1:2], main="Theoretical distribution function", ylab="F0(x)")
abline(h=0,  col="gray70", lty="dashed")
abline(h=1,  col="gray70", lty="dashed")
usr <- par("usr")
x0 <- qnorm(f0)
lines(c(usr[1], x0), c(f0, f0), lty="dashed")
lines(c(x0, x0), c(0, f0), lty="dashed")

plot(x, qnorm(fh(x)), xlim=usr[1:2], ylim=usr[1:2], main="Q-Q plot", xlab="x", pch=19, col="gray", ylab="x0")
points(xt, x0, pch=19) 
abline(a=0, b=1)

## PP plot
plot(ecdf(x), main="Empirical distribution function")
usr <- par("usr")
lines(c(xt,xt), c(0, f0), lty="dashed")
lines(c(xt, usr[2]), c(f0, f0), lty="dashed")
text(usr[2]*0.95, f0, pos=3, "q")

x0 <- (-300:300)/100
plot(x0, pnorm(x0), type="l", xlim=usr[1:2], main="Theoretical distribution function", ylab="F0(x)", xlab="x")
abline(h=0,  col="gray70", lty="dashed")
abline(h=1,  col="gray70", lty="dashed")
usr <- par("usr")

t0 <- pnorm(xt)
lines(c(xt,xt), c(0, t0), lty="dashed")
lines(c(xt, usr[2]), c(t0, t0), lty="dashed")
text(usr[2]*0.95, t0, pos=3, expression(q[0]))

plot(fh(x), pnorm(x), pch=19, xlim=c(0,1), ylim=c(0,1), main="P-P plot", xlab="q", ylab=expression(q[0]), col="gray")
points(f0, t0, pch=19)
abline(a=0, b=1)
dev.off()

