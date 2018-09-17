curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(2)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(2)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="red", lwd=4, lty=1, cex.lab=1.2, sub="Abb. 3: G\u00FCtefunktion mit mu_0=1000, alpha=0,05, sigma=10 und vier verschiedenen n")
par(new=TRUE)
curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(5)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(5)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="black", lwd=4, lty=1, cex.lab=1.2)
par(new=TRUE)
curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(10)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(10)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="blue", lwd=4, lty=1, cex.lab=1.2)
par(new=TRUE)
curve(from=-1.5, to=1.5, expr=1-(pnorm((1.96-x*sqrt(15)), mean=x, sd=1))+(pnorm((-1.96-x*sqrt(15)), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab=expression(mu), ylim=c(0,1), col="darkgreen", lwd=4, lty=1, cex.lab=1.2)

abline(v=0, col="black", lwd=2, lty=2)

axis( side=1, at=c(-1.5, -0.75, 0, 0.75, 1.5), labels=c("988","994","1000","1006","1012"), tick=FALSE, cex.axis=1.5, font.axis=1.5)
legend("bottomright", lwd=4, col=c("red","black","blue","darkgreen"),c(expression("n=9"),expression("n=16"),expression("n=25"),expression("n=36")), bty="n", cex=1.5)


