par(font=2)
par(mar=c(2,1,2,1)+0.1)
c=1.4

plot(2.5, 3, pch=4, col="red", lwd=2, xaxt="n", yaxt="n", xlim=c(0,6), ylim=c(0,4.5), xlab="", ylab="", axes=F, cex=2)
arrows(0, 0, 0, 4.7, code = 2, xpd = TRUE, angle=20, length=0.15)
arrows(0, 0, 6.2, 0, code = 2, xpd = TRUE, angle=20, length=0.15)
lines(c(0,6), c(1, 3.4), lwd=3, col="green")
mtext("X", side=1, line=0, at=6.3, cex=c)
mtext("Y", side=2, line=0, at=4.8, las=2, cex=c)

arrows(2.5, 2, 2.5, 3, code=3, angle=20, length=0.1)
arrows(2.5, 1.6, 2.5, 2, code=3, angle=20, length=0.1)
arrows(3.55, 1.6, 3.55, 3, code=3, angle=20, length=0.1)

lines(c(0, 4), c(3, 3))
lines(c(0, 2.5), c(2, 2))
lines(c(0, 5), c(1.6, 1.6))

mtext(expression(bold(y["i"])), side=2, line=0, at=3, las=2, cex=c)
mtext(expression(bold(hat(y)["i"])), side=2, line=0, at=2, las=2, cex=c)
mtext(expression(bold(bar(y))), side=2, line=0, at=1.6, las=2, cex=c)
mtext(expression(bold(X["i"])), side=1, line=0, at=2.5, cex=c)

points(c(2.5,0,0,0), c(0,1.6,2,3), pch=15, cex=0.8)

text(5.5, 3.7, expression(bold(hat(y) * "=" * b["0"] * "+" * b["1"]*x)), cex=c)
text(2, 2.5, expression(bold(y["i"] * "-" * hat(y)[i] * "=" * hat(u)["i"])), cex=c)
text(3.9, 2.1, expression(bold(y["i"] * "-" * bar(y))), cex=c)
text(2.8, 1.8, expression(bold(hat(y)["i"] * "-" * bar(y))), cex=c)
