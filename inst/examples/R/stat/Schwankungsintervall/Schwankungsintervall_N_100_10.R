curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
axis( side=1, at=c(60, 74.2, 125.8), labels=c("60", "74,2", "125,8"), tick=FALSE)

par(new=TRUE)

xx <-c(74.5:125.5, 125.5:74.5)
yy <-c(c(dnorm(c(74.5:125.5), mean=100, sd=10)),c(rep(0,52)))

polygon(xx, yy, col="grey", border=NA)

par(new=TRUE)

curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")


abline(v=74.2, col="black", lwd=2)
abline(v=125.8, col="black", lwd=2)
