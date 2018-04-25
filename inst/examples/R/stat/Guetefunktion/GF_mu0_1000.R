curve(from=-3, to=3, expr=1-(pnorm((1.96-x), mean=x, sd=1))+(pnorm((-1.96-x), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab="", ylim=c(0,1), col="red", lwd=4, lty=1, cex.lab=1.2)

abline(v=0, col="grey", lwd=2, lty=2)

axis( side=1, at=c( 0, 3), labels=c(expression(paste(mu[0], "=1000")), expression(mu)), tick=FALSE, cex.axis=1.5, font.axis=1.2)
