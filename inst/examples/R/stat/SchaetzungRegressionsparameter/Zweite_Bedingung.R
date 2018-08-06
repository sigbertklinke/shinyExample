par(font=2)
par(mar=c(2,1,2,1)+0.1)
c=1.6
d="yellow"

plot(-100, -100, lty=0, col="red", lwd=0, xaxt="n", yaxt="n", xlim=c(0,6), ylim=c(0,6), xlab="", ylab="", axes=F)
arrows(0, 0, 0, 6.2, code = 2, xpd = TRUE, angle=20, length=0.15)
arrows(0, 0, 6.2, 0, code = 2, xpd = TRUE, angle=20, length=0.15)
lines(c(0,6), c(1, 3.4), lwd=2, col="green")
mtext("X", side=1, line=0, at=6.3, cex=c)
mtext("Y", side=2, line=0, at=6.3, las=2, cex=c)

rect(1, 0.6, 1.8, 1.4, col=d)
points(1, 1.4, pch=16)
text(0.85, 1.55, expression(bold(hat(y["1"]))), cex=c)
points(1, 0.6, pch=16)
text(0.85, 0.55, expression(bold(y["1"])), cex=c)

rect(1.82, 1.92, 2.3, 2.4, col=d)
points(2.3, 1.92, pch=16)
text(2.45, 1.84, expression(bold(hat(y["2"]))), cex=c)
points(2.3, 2.4, pch=16)
text(2.45, 2.45, expression(bold(y["2"])), cex=c)

rect(2.7, 1.5, 3.28, 2.08, col=d)
points(2.7, 2.08, pch=16)
text(2.85, 2.33, expression(bold(hat(y["3"]))), cex=c)
points(2.7, 1.5, pch=16)
text(2.85, 1.35, expression(bold(y["3"])), cex=c)

rect(3, 2.6, 4, 3.6, col=d)
points(4, 2.6, pch=16)
text(4.15, 2.5, expression(bold(hat(y["4"]))), cex=c)
points(4, 3.6, pch=16)
text(4.15, 3.6, expression(bold(y["4"])), cex=c)

rect(4.7, 3.2, 5.5, 4, col=d)
points(5.5, 3.2, pch=16)
text(5.65, 3.10, expression(bold(hat(y["5"]))), cex=c)
points(5.5, 4, pch=16)
text(5.65, 4.2, expression(bold(y["5"])), cex=c)
