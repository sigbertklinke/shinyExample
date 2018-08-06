x=c(0:24)
P1<- dpois(x, lambda=10)

plot(main="Wahrscheinlichkeitsfunktion der PO(10)", P1, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 24), ylim=c(0.0,0.14), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", las=1, font.axis=2 )
axis(side=1, at=c(0:24), font.axis=2)
lines(c(0:24), P1, type="h", lwd=5, col="gray")