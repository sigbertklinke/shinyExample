x=c(0:9)
P1<- dpois(x, lambda=2)

plot(P1, col="white", xaxt="n",xpd=TRUE, xlim= c(0, 9), main="Wahrscheinlichkeitsfunktion der PO(2)", ylim=c(0.0,0.3), ylab="f(x)", xlab="x", font.lab=2, "yaxs"="i", las=1, font.axis=2, )
axis(side=1, at=c(0:9), font.axis=2)
lines(c(0:9), P1, type="h", lwd=5, col="gray")
