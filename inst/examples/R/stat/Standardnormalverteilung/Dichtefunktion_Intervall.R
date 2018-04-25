curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
axis( side=1, at=c(60, 88.8, 132), labels=c("60", "88,8", "132"), tick=FALSE)

par(new=TRUE)

xx <-c(88.8:131.8, 131.8:88.8)
yy <-c(c(dnorm(c(88.8:131.8), mean=100, sd=10)),c(rep(0,44)))

polygon(xx, yy, col="grey", border=NA)

par(new=TRUE)

curve(from=60, to=140, dnorm(x, mean=100, sd=10), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")


abline(v=88.8, col="black", lwd=2)
abline(v=132, col="black", lwd=2)
