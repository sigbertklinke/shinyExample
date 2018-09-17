par(mfrow=c(1,2),cex.axis=2) 

curve(from=-40, to=60, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=-10, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")

par(new=TRUE)
xx1 <-c(-35:5, 5:-35)
yy1 <-c(c(dnorm(c(-35:5), mean=0, sd=10)),c(rep(0,41)))
polygon(xx1, yy1, col="lightblue", border=NA)

par(new=TRUE)
xx2 <-c(5:60, 60:5)
yy2 <-c(c(dnorm(c(5:60), mean=-10, sd=10)),c(rep(0,56)))
polygon(xx2, yy2, col="pink", border=NA)

par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=0, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=-10, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")


abline(v=-10,col="black", lwd=1, lty=2)
abline(v=0,col="black", lwd=1, lty=2)
abline(v=5, col="black", lwd=2, lty=1)

text(-6.5, 0.008, expression(beta), col = "black", cex=2)
text(8.5, 0.003, expression(alpha), col = "black", cex=2)

axis( side=1, at=c(-10, 0, 5, 60), labels=c(expression(theta[0]), expression(theta[1]), "C", "V"), cex=1, tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(V)"), tick=FALSE)

legend("topright", lwd=4, col=c("red","blue"),c("Verteilung unter H0", "Verteilung unter H1"), bty="n")


curve(from=-40, to=60, dnorm(x, mean=-10, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=25, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")

par(new=TRUE)
xx1 <-c(-15:5, 5:-15)
yy1 <-c(c(dnorm(c(-15:5), mean=25, sd=10)),c(rep(0,21)))
polygon(xx1, yy1, col="lightblue", border=NA)
par(new=TRUE)
xx2 <-c(5:60, 60:5)
yy2 <-c(c(dnorm(c(5:60), mean=-10, sd=10)),c(rep(0,56)))
polygon(xx2, yy2, col="pink", border=NA)

par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=-10, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")
par(new=TRUE)
curve(from=-40, to=60, dnorm(x, mean=25, sd=10), xaxt="n", yaxt="n",ylab="", xlab="", col="blue", ylim=c(0.0,0.04), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l", main= "Nichtablehnungsbereich der H0 |Ablehnungsbereich der H0")

abline(v=-10,col="black", lwd=1, lty=2)
abline(v=5, col="black", lwd=2, lty=1)
abline(v=25,col="black", lwd=1, lty=2)

text(3, 0.001, expression(beta), col = "black", cex=2)
text(8, 0.0025, expression(alpha), col = "black", cex=2)

axis( side=1, at=c(-10, 5, 25, 60), labels=c(expression(theta[0]), "C", expression(theta[1]), "V"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(V)"), tick=FALSE)

legend("topright", lwd=4, col=c("red","blue"),c("Verteilung unter H0", "Verteilung unter H1"), bty="n")
