par(mfrow=c(2,1))
#
curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.045),
      lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main=expression(paste("P<", alpha, ': ', H[0], ' ablehnen')))
abline(v=23, col="black", lwd=3, lty=2)
text(24, 0.0012, expression(P), col = "black", cex=1.2)
abline(v=20, col="black", lwd=3)
text(21, 0.002, expression(alpha), col = "black", cex=1.5)
axis(side=1, at=c(22, 18), labels=c("v", "c"), tick=FALSE)
axis(side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE)
text(+30, 0.042, expression(paste("Ablehnungsbereich ", H[0])))
text(0, 0.042, expression(paste("Annahmebereich ", H[0])))
#
curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.045),
      lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main=expression(paste("P>", alpha, ': ', H[0], ' beibehalten')))
abline(v=17, col="black", lwd=3, lty=2)
text(18.5, 0.002, expression(P), col = "black", cex=1.2)
abline(v=20, col="black", lwd=3)
text(21, 0.002, expression(alpha), col = "black", cex=1.5)
axis( side=1, at=c(17, 21), labels=c("v", "c"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE)
text(+32, 0.042, expression(paste("Ablehnungsbereich ", H[0])))
text(0, 0.042, expression(paste("Annahmebereich ", H[0])))
