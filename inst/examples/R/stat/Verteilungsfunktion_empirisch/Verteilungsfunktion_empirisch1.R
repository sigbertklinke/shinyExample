par(mar=c(0.1, 1.1, 2.1, 2.1))
matplot(c(-0.5:6), c(-0.5:6), type="n", axes = FALSE, ylab="", xlab="")

axis(1, at = c(1:6), pos=1, tck = 0,
     labels = c("", expression(x[j]^u, x),"", expression(x[j]^o),""))
axis(2, at = c(1:6), pos=1, las = 1, tck = 0,
     labels = c("",expression(F(x[j]^u), F(x)),"", expression(F(x[j]^o)),""))

lines(x = c(2,5), y = c(2,5), lwd=3)

#vertical lines
lines(x = c(1,5), y = c(2,2), lty=2)
lines(x = c(1,5), y = c(3,3), lty=2)
lines(x = c(1,5), y = c(5,5), lty=2)

#horizontal lines
lines(x = c(2,2), y = c(1,2), lty=2)
lines(x = c(3,3), y = c(1,3), lty=2)
lines(x = c(5,5), y = c(1,5), lty=2)

#arrows
arrows(x0 = 5.5, y0 = 2, x1 = 5.5, y1 = 5, col = "blue")
arrows(x0 = 5.5, y0 = 5, x1 = 5.5, y1 = 2, col = "blue")
text(x = 5.65, y = 3.5, labels="f(x)", col = "blue")

arrows(x0 = 4.5, y0 = 2, x1 = 4.5, y1 = 3, col = "blue")
arrows(x0 = 4.5, y0 = 3, x1 = 4.5, y1 = 2, col = "blue")
text(x = 4, y = 2.5, labels=expression(F(x) - F(x[j]^u)), col = "blue")

arrows(x0 = 2, y0 = -0.35, x1 = 5, y1 = -0.35, col = "blue")
arrows(x0 = 5, y0 = -0.35, x1 = 2, y1 = -0.35, col = "blue")
text(x = 3.5, y = -0.1, labels=expression(x[j]^o - x[j]^u), col = "blue")

arrows(x0 = 2, y0 = 0.1, x1 = 3, y1 = 0.1, col = "blue")
arrows(x0 = 3, y0 = 0.1, x1 = 2, y1 = 0.1, col = "blue")
text(x = 2.5, y = 0.35, labels=expression(x - x[j]^u), col = "blue")