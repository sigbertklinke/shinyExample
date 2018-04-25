curve(from=-6, to=6, dnorm(x, mean=0, sd=2), ylab="f(theta)", xlab="", col="blue", xaxt="n", ylim=c(0.0,0.4), lty=1, lwd=4, font.lab=1,"xaxs"="i" ,"yaxs"="i", bty="l")
par(new=TRUE)
curve(from=-6, to=6, dnorm(x, mean=0, sd=1), ylab="f(theta)", xlab="",  col="red", ylim=c(0.0,0.4),xaxt="n", lty=1, lwd=4, font.lab=1,"xaxs"="i" ,"yaxs"="i", bty="l")
par(new=TRUE)
curve(from=-6, to=6, dnorm(x, mean=1, sd=1), ylab="f(theta)",  xlab="",  col="darkgreen", ylim=c(0.0,0.4), xaxt="n",lty=1, lwd=4, font.lab=1,"xaxs"="i" ,"yaxs"="i", bty="l")
axis(side = 1, at = c(0), labels= c("theta"), tick=FALSE)

abline(v=0, lwd=4, lty=2)

legend("topright", lwd=4, col=c("red","blue", "darkgreen"),c("theta 1","theta 2","theta 3"), bty="n")
