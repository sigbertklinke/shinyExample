x <- c(0:8)
WVert<- dbinom(x, 8, 0.65)
WVert2<- dbinom(x, 8, 0.35)
plot(WVert, col="WHITE", xaxt="n", ylab="f(X)", ylim=c(0, 0.3), xlim=c(0, 8), xlab="X", font.lab=2, 
     main="B(8;0,65) - blau         B(8;0,35) - rot", las=1, font.axis=2,sub="Abb. 1: Wahrscheinlichkeitsfunktion der B(8;0,35) und der B(8;0,65)")
lines(c(0:8)-0.1, WVert, type="h", lwd=5, col="BLUE")
lines(c(0:8)+0.1, WVert2, type="h", lwd=5, col="RED")
axis(side=1, at=c(0:8), font.axis=2)