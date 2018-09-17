dev.off()
curve(from=-3, to=0.5, expr=(pnorm((-1.96-x), mean=x, sd=1)), ylab=expression(paste("G(", mu, ")")), xaxt="n", "xaxs"="i", yaxs="i", bty="l", xlab="", ylim=c(0,1), col="red", lwd=4, lty=1)

abline(v=-1, col="grey", lwd=2, lty=2)
abline(v=0, col="black", lwd=2, lty=2)

text(0.2, 0.7, expression(paste("1-" , alpha)), col = "black", cex=2)
text(-0.2, 0.03, expression(alpha), col = "black", cex=2)
text(-0.9, 0.85, expression(beta), col = "black", cex=2)
text(-1.2, 0.25, expression(paste("1-" , beta)), col = "black", cex=2)

axis( side=1, at=c( -1, 0, 0.5), labels=c(expression(mu[1]), expression(mu[0]), expression(mu)), tick=FALSE, cex.axis=1.5, font.axis=2)
