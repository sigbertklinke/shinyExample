x <- c(0:4)
WVert<- dbinom(x, 4, 0.25)
WVert2<- pbinom(x, 4, 0.25)
plot(WVert, col="WHITE", xaxt="n", ylab="f(X), F(X)", ylim=c(0, 1), xlim=c(0, 4), xlab="X", font.lab=2, 
     main="fB(4;0,25) - blau         FB(4;0,25) - rot", las=1, font.axis=2)
lines(c(0:4)-0.05, WVert, type="h", lwd=5, col="BLUE")
lines(c(0:4)+0.05, WVert2, type="h", lwd=5, col="RED")
axis(side=1, at=c(0:4), font.axis=2)