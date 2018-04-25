curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
axis( side=1, at=c(60, 94.8), labels=c("60", "94,8"), tick=FALSE)

par(new=TRUE)

xx <-c(94.8:140.8, 140.8:94.8)
yy <-c(c(dnorm(c(94.8:140.8), mean=100, sd=10)),c(rep(0,47)))

polygon(xx, yy, col="grey", border=NA)

par(new=TRUE)

curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")


abline(v=94.8, col="black", lwd=2)
