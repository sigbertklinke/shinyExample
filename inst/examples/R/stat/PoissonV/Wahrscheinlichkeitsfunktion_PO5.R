
x=c(0:15)
P1<- dpois(x, lambda=5)

plot(main="Wahrscheinlichkeitsfunktion der PO(5)",P1, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 15), ylim=c(0.0,0.2), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", las=1, font.axis=2 )
axis(side=1, at=c(0:15), font.axis=2)
lines(c(0:15), P1, type="h", lwd=5, col="gray")

