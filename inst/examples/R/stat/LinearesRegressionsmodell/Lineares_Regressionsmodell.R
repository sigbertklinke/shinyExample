par(font=2)
par(mar=c(2,1,2,1)+0.1)
c=1.4

plot(2.5, 3, pch=4, col="red", lwd=2, xaxt="n", yaxt="n", xlim=c(0,6), ylim=c(0,4.5), xlab="", ylab="", axes=F, cex=2)

arrows(0, 0, 0, 4.7, code = 2, xpd = TRUE, angle=20, length=0.15)
arrows(0, 0, 6.2, 0, code = 2, xpd = TRUE, angle=20, length=0.15)
arrows(0.3, 0, 0.3, 1, code=3, angle=20, length=0.1)
arrows(1, 1, 1, 1.4, code=3, angle=20, length=0.1)
arrows(3.55, 0, 3.55, 3, code=3, angle=20, length=0.1)
arrows(1.7, 2, 1.7, 3, code=3, angle=20, length=0.1)
arrows(2.8, 0, 2.8, 2, code=3, angle=20, length=0.1)

lines(c(0,6), c(1, 3.4), lwd=2, col="green")
lines(c(0,1), c(1,1))
lines(c(1.7, 3.55), c(3, 3))
lines(c(1.7, 3.2), c(2,2))

points(c(1,2.5), c(0, 0), pch=15, cex=0.5)

mtext("1", side=1, line=0, at=1, cex=c)
mtext(expression(bold(X["i"])), side=1, line=0, at=2.5, cex=c)
mtext("X", side=1, line=0, at=6.3, cex=c)
mtext("Y", side=2, line=0, at=4.8, las=2, cex=c)

text(5.5, 3.7, expression(bold(hat(y) * "=" * b["0"] * "+" * b["1"]*x)), cex=c)
text(0.5, 0.5, expression(bold(b["0"])), cex=c)
text(1.2, 1.2, expression(bold(b["1"])), cex=c)
text(3.7, 1.4, expression(bold(y["i"])), cex=c)
text(1.2, 2.5, expression(bold(y["i"] * "-" * hat(y)["i"] * "=" * hat(u)["i"])), cex=c)
text(3, 1, expression(bold(hat(y)["i"])), cex=c)