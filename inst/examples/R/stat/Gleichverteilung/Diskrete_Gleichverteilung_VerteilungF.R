
x <- c(1:6)
plot(ecdf(x),ylab="F(x)", xlab="x", main="Verteilungsfunktion", col="blue", xaxt="n", yaxt="n", lwd=3)
axis (side=1, at=c(1:6))
axis (side=2, at=c(0, 0.5, 1.0))
