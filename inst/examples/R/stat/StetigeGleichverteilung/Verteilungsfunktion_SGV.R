x <- c(0, 5, 25, 30)
y <- c(0, 0, 1, 1)
plot(x, y, type="l", lwd=3, col="red", xaxt="n", xlab="X", ylab="F(X)", ylim = c(0, 1.2), 
     xlim= c(0, 30), xaxp=c(0, 30, 5))
axis (side=1, at=c(5, 25), labels=c("a", "b"))
