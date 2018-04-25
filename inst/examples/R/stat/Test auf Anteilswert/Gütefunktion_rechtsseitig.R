curve(from=0, to=0.60, expr=1-pbinom(5, 25, x), ylab=expression(paste("G(", pi, ")")),  "xaxs"="i", yaxs="i", bty="l", xlab=expression(pi), ylim=c(0,1), col="red", lwd=4, lty=1)

abline(v=.2, col="black", lwd=3, lty=3)
abline(v=.1,col="black", lwd=3, lty=2)

text(0.13, 0.6, expression(paste("1-" , alpha)), col = "black", cex=2)
text(0.115, 0.025, expression(alpha), col = "black", cex=2)
text(0.22, 0.8, expression(beta), col = "black", cex=2)
text(0.23, 0.2, expression(paste("1-" , beta)), col = "black", cex=2)
