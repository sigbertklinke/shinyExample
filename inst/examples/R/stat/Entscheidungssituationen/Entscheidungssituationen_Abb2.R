# (C) 2018 Sigbert Klinke, Humboldt-Universität zu Berlin
par(mfrow=c(2,1), mar=c(3,1,1,1))
#
c  <- 1.2
x <- (-40:60)/10
plot(0,0, type="n", axes=FALSE, ylab="", xlab="", xlim=range(x), ylim=c(0, 0.4))
#
xx <- seq(min(x), c, by=0.1)
yy <- dnorm(xx, mean=2)
polygon(c(xx, c), c(yy, 0), col="lightblue", border=NA)
#
xx <- seq(c, max(x), by=0.1)
yy <- dnorm(xx, mean=0)
polygon(c(xx, c), c(yy, 0), col="pink", border=NA)
#
lines(x, dnorm(x, mean=0), col="red")
lines(x, dnorm(x, mean=2), col="blue")
#
abline(v=0, col="black", lty=2)
abline(v=2, col="black", lty=2)
abline(v=c, col="black", lty=1)
#
box()
axis(side=1, at=c(0, c, 2, 6), labels=c(expression(theta[0]), "c", expression(theta[1]), "v"), cex.axis=1, tick=FALSE)
#
text(0.75, 0.08, expression(beta), col = "black")
text(1.75, 0.04, expression(alpha), col = "black")
#
legend("topright", lwd=1, col=c("red","blue"), title="Verteilung von V", c("unter H0", "unter H1"), cex=0.75)
######
#
c  <- 0.2
x <- (-40:60)/10
plot(0,0, type="n", axes=FALSE, ylab="", xlab="", xlim=range(x), ylim=c(0, 0.4))
#
xx <- seq(min(x), c, by=0.1)
yy <- dnorm(xx, mean=2)
polygon(c(xx, c), c(yy, 0), col="lightblue", border=NA)
#
xx <- seq(c, max(x), by=0.1)
yy <- dnorm(xx, mean=-1)
polygon(c(xx, c), c(yy, 0), col="pink", border=NA)
#
lines(x, dnorm(x, mean=-1), col="red")
lines(x, dnorm(x, mean=2), col="blue")
#
abline(v=-1, col="black", lty=2)
abline(v=2, col="black", lty=2)
abline(v=c, col="black", lty=1)
#
box()
axis(side=1, at=c(-1, c, 2, 6), labels=c(expression(theta[0]), "c", expression(theta[1]), "v"), cex.axis=1, tick=FALSE)
#
text(0, 0.02, expression(beta), col = "black")
text(0.7, 0.04, expression(alpha), col = "black")
#
legend("topright", lwd=1, col=c("red","blue"), title="Verteilung von V", c("unter H0", "unter H1"), cex=0.75)

