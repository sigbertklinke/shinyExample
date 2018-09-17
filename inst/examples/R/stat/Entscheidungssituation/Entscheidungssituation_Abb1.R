par(mfrow=c(1,2),cex.axis=2) 

curve(from=-40, to=60, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=20, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")

par(new=TRUE)
xx1 <-c(-15:15, 15:-15)
yy1 <-c(c(dnorm(c(-15:15), mean=20, sd=10)),c(rep(0,31)))
polygon(xx1, yy1, col="lightblue", border=NA)
par(new=TRUE)
xx2 <-c(15:60, 60:15)
yy2 <-c(c(dnorm(c(15:60), mean=0, sd=10)),c(rep(0,46)))
polygon(xx2, yy2, col="pink", border=NA)

par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=20, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")

abline(v=0,col="black", lwd=1, lty=2)
abline(v=20,col="black", lwd=1, lty=2)
abline(v=15, col="black", lwd=2, lty=1)

text(7.5, 0.008, expression(beta), col = "black", cex=2)
text(17.5, 0.004, expression(alpha), col = "black", cex=2)

axis( side=1, at=c(0, 15, 20, 60), labels=c(expression(theta[0]), "C", expression(theta[1]), "V"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(V)"), tick=FALSE)

legend("topright", lwd=4, col=c("red","blue"),c("Verteilung unter H0", "Verteilung unter H1"), bty="n")

curve(from=-40, to=60, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=20, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")

par(new=TRUE)
xx1 <-c(-15:20, 20:-15)
yy1 <-c(c(dnorm(c(-15:20), mean=20, sd=10)),c(rep(0,36)))
polygon(xx1, yy1, col="lightblue", border=NA)
par(new=TRUE)
xx2 <-c(20:60, 60:20)
yy2 <-c(c(dnorm(c(20:60), mean=0, sd=10)),c(rep(0,41)))
polygon(xx2, yy2, col="pink", border=NA)

par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=20, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")

abline(v=0,col="black", lwd=1, lty=2)
abline(v=20,col="black", lwd=1, lty=2)
abline(v=19.8, col="black", lwd=2, lty=1)

text(10, 0.005, expression(beta), col = "black", cex=2)
text(22.5, 0.0015, expression(alpha), col = "black", cex=2)

axis( side=1, at=c(0, 18, 23, 60), labels=c(expression(theta[0]), "C", expression(theta[1]), "V"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(V)"), tick=FALSE)

legend("topright", lwd=4, col=c("red","blue"),c("Verteilung unter H0", "Verteilung unter H1"), bty="n")
