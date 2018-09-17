curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", sub="Abb. 6: Signifikanzniveau und \u00DCberschreitungswahrscheinlichkeit bei G\u00FCltigkeit der H_0")
abline(v=17, col="black", lwd=3, lty=2)
text(18.5, 0.0018, expression(P), col = "black", cex=1.2)
abline(v=21, col="black", lwd=3)
text(23, 0.0014, expression(alpha), col = "black", cex=1.7)
axis( side=1, at=c(17, 21), labels=c("v", "c"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE)

