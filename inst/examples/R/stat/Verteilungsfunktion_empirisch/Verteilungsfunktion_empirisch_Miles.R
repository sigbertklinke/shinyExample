y <- c(0, 0.108, 0.243, 0.513, 0.689, 0.851, 0.905, 0.946, 0.987, 0.987,  1)
x <- c(1:11)
plot(x, y, type="o", axes = FALSE, col = "blue", xlab= "x", ylab="F(x)", lwd=2, pch=8, 
     main="Verteilungsfunktion 'miles per gallon'", font.lab=2)
axis(1, at = c(0:10), labels = seq(9, 41, by=3))
axis(2, at = c(0, seq(from=0, to=1, by=0.1)), las=1)
lines(x = c(0, 5), y = c(0.689, 0.689), col = "red")
lines(x = c(5, 5), y = c(0, 0.689), col = "red")