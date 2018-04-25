curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
axis( side=1, at=c(60, 80.4, 119.6), labels=c("60", "80,4", "119,6"), tick=FALSE)

par(new=TRUE)

xx <-c(80.4:119.6, 119.6:80.4)
yy <-c(c(dnorm(c(80.4:119.6), mean=100, sd=10)),c(rep(0,40)))

polygon(xx, yy, col="grey", border=NA)

par(new=TRUE)

curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")


abline(v=80.4, col="black", lwd=2)
abline(v=119.6, col="black", lwd=2)
