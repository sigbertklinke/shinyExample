x=c(0:15)
P1<- dpois(x, lambda=5)
P2<- dpois(x, lambda=1)

par(mfrow=c(2,1))

plot(P1, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 15), ylim=c(0.0,0.45), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", main="lambda=5", las=1, font.axis=2 )
axis(side=1, at=c(0:15), font.axis=2)
lines(c(0:15), P1, type="h", lwd=5, col="gray")
box(which="figure")

plot(P2, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 15), ylim=c(0.0,0.45), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", main="lambda=1", las=1, font.axis=2 )
axis(side=1, at=c(0:15), font.axis=2)
lines(c(0:15), P2, type="h", lwd=5, col="gray")
box(which="figure")
box(which="outer")
