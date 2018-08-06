x=c(0:8)
H1<- dhyper(x, n=80, m=20, k=10)
H2<- dhyper(x, n=8, m=8, k=8)

par(mfrow=c(2,1)) # Figure margings are too large ?!

plot(H1, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 8), ylim=c(0.0,0.5), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", main="N=100, M=20, n=10", las=1, font.axis=2 )
axis(side=1, at=c(0,2,4,6,8), font.axis=2)
lines(c(0:8), H1, type="h", lwd=5, col="BLUE")
box(which="figure")

plot(H2, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 8), ylim=c(0.0,0.5), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", main="N=16, M=8, n=8", las=1, font.axis=2 )
axis(side=1, at=c(0,2,4,6,8), font.axis=2)
lines(c(0:8), H2, type="h", lwd=5, col="BLUE")
box(which="figure")
box(which="outer")

