
curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", sub="Abb. 3: Signifikanzniveau und Entscheidungsbereiche beim rechtsseitigen Test")

par(new=TRUE)
xx1 <-c(20:40, 40:20)
yy1 <-c(c(dnorm(c(20:40), mean=0, sd=10)),c(rep(0,21)))
polygon(xx1, yy1, col="lightgreen", border=NA)

par(new=TRUE)
curve(from=-40, to=40, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")

abline(v=20, col="black", lwd=3)
text(23, 0.001, expression(alpha), col = "black", cex=2)
axis( side=1, at=c(20), labels=c("c"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE) 
