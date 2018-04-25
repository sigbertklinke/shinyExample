par(las=1)
curve(from=0, to=20, dnorm(x, mean=10, sd=3), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.14), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
axis( side=1, at=c(10, 12.5), labels=c("10", "12,5"), tick=TRUE, padj=0)
axis( side=1, at=c(11.5), labels=c("11,5"), tick=TRUE, padj=2)

par(new=TRUE)

xx <-c(11.5:12.5, 12.5:11.5)
yy <-c(c(dnorm(c(11.5:12.5), mean=10, sd=3)),c(rep(0,2)))

polygon(xx, yy, col="grey", border=NA)

par(new=TRUE)

curve(from=0, to=20, dnorm(x, mean=10, sd=3), xaxt="n", ylab="f(x)", xlab="x", col="blue", ylim=c(0.0,0.14), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")


abline(v=11.5, col="black", lwd=1, lty=2)
abline(v=12.5, col="black", lwd=1, lty=2)