WVert<- dbinom(c(0:5),5,0.3)
plot(WVert, col="WHITE", xaxt="n",xpd=TRUE, xlim= c(0, 5), ylab="f(X)", xlab="X", font.lab=2, 
     main="B(5;0,3)", las=1, font.axis=2 )
axis(side=1, at=c(0:5), font.axis=2)
lines(c(0:5), WVert, type="h", lwd=5, col="BLUE")