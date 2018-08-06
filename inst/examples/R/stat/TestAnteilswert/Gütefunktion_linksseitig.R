curve(from=0, to=0.40, expr=pbinom(2, 30, x), ylab=expression(paste("G(", pi, ")")),  "xaxs"="i", yaxs="i", bty="l", xlab=expression(pi), ylim=c(0,1), col="red", lwd=4, lty=1)

abline(v=.2, col="black", lwd=3, lty=2)
abline(v=.15,col="black", lwd=3, lty=3)

text(0.22, 0.6, expression(paste("1-" , alpha)), col = "black", cex=2)
text(0.18, 0.025, expression(alpha), col = "black", cex=2)
text(0.14, 0.6, expression(beta), col = "black", cex=2)
text(0.13, 0.04, expression(paste("1-" , beta)), col = "black", cex=2)
