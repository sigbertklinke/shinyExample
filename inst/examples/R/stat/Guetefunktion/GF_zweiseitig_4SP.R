curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(2)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(2)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="red", lwd=4, lty=1)
par(new=TRUE)
curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(5)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(5)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="black", lwd=4, lty=1)
par(new=TRUE)
curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(10)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(10)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="blue", lwd=4, lty=1)
par(new=TRUE)
curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(15)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(15)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="darkgreen", lwd=4, lty=1)

abline(v=0, col="black", lwd=2, lty=2)

axis( side=1, at=c(0), labels=c(expression(mu[0])), tick=FALSE, cex.axis=1.5, font.axis=2)
legend("bottomright", lwd=4, col=c("red","black","blue","darkgreen"),c(expression("n"[1]),expression("n"[2]),expression("n"[3]),expression("n"[4])), bty="n", cex=1.5)
