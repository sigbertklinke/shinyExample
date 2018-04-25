x <- c(5, 25)
y <- c(0.05, 0.05)
plot(x, y, type="l", xaxt="n", yaxt="n", xlab="X", ylab="f(X)", col="blue", lwd=3, ylim = c(0, 0.06), 
     xlim= c(0, 30), xaxp=c(0, 25, 5), main="Dichtefunktion ( Gleichverteilung [0;20] )")
axis (side=1, at=c(5, 10, 15, 20, 25), labels=c(0, 5, 10, 15, 20) )
axis (side=2, at=c(0.01, 0.02, 0.03, 0.04, 0.05, 0.06)) 
lines(x=c(5,5), y=c(0, 0.05), lty=3, lwd=3, col="lightblue")
lines(x=c(25,25), y=c(0, 0.05), lty=3, lwd=3, col="lightblue")