x <- c(5, 25)
y <- c(0, 1)
plot(x, y, type="l", lwd=3, col="blue", xaxt="n", yaxt="n", xlab="X", ylab="F(X)", ylim = c(0, 1.2), 
     xlim= c(0, 30), main="Verteilungsfunktion ( Gleichverteilung [0,20] )")
axis (side=1, at=c(5, 10, 15, 20, 25), labels=c(0, 5, 10, 15, 20))
axis (side=2, at=c(0, 0.5, 1.0)) 
axis (side=4, at=c(0, 0.5, 1.0), labels=c(NA, NA, NA) )
lines(x=c(0, 5), y=c(0, 0), lwd=3, col="lightblue")
lines(x=c(25, 30), y=c(1, 1), lwd=3, col="lightblue")