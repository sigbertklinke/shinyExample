curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", sub="Abb. 4: \u00DCberschreitungswahrscheinlichkeit bei G\u00FCltigkeit der H_0")

par(new=TRUE)
xx1 <-c(20:40, 40:20)
yy1 <-c(c(dnorm(c(20:40), mean=0, sd=10)),c(rep(0,21)))
polygon(xx1, yy1, col="aquamarine", border=NA)

par(new=TRUE)

curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")

abline(v=20, col="black", lwd=3, lty=2)
text(22.5, 0.0014, expression(P), col = "black", cex=1.5)
axis( side=1, at=c(20), labels=c("v"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE) 
