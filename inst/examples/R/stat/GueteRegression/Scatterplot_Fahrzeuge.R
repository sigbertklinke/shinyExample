par(mar=c(5, 4, 4, 2) + 0.1)
par(mfrow=c(1,2))

x = c(186, 173, 168, 189, 174, 177, 196, 222, 218, 170, 200, 207, 200, 221, 204, 204, 163, 212, 193, 200, 179, 197, 170, 165, 170, 184, 163, 206, 216, 220, 161, 147, 179, 172, 149, 233, 230, 201, 154, 169, 221, 217, 212, 198, 195, 220, 198, 198, 218, 200, 180, 206, 192, 170, 157, 165, 182, 201, 214, 198, 201, 199, 203, 179, 142, 164, 174, 165, 175, 155, 155, 156, 172, 193)

y = c(40, 40, 35, 37, 36, 34, 40, 43, 43, 34, 42, 43, 42, 44, 43, 45, 34, 43, 41, 41, 40, 43, 35, 32, 34, 38, 35, 46, 48, 46, 36, 33, 42, 36, 34, 51, 48, 41, 33, 39, 48, 45, 44, 41, 43, 43, 42, 42, 42, 43, 40, 43, 38, 37, 37, 36, 38, 44, 42, 42, 45, 40, 43, 41, 34, 36, 36, 35, 36, 35, 35, 36, 36, 37)

plot(c(0,0), xlim=c(135, 245), ylim=c(31, 52), xlab="length", ylab="turn - diam", font.lab=2, cex.lab=1.4, las=1); #summary(lm(y~x))
lines(rep(x[53], 2), c(30, 7.1739+0.1735*x[53]), col="blue", lwd=2)
lines(c(130, x[53]), rep(y[53], 2), col="cyan", lwd=2)
lines(c(130, x[53]), rep(7.1739+0.1735*x[53], 2), col="blue", lwd=2)
points(x[-53], y[-53], pch=16, col="red", cex=1.25)
abline(7.1739, 0.1735, lwd=3)
points(x[53], y[53], pch=19, cex=2, col="green3")
text(202, 38, expression(x[53]), cex=1.75)

par(mar=rep(0,4))
plot.new()
par(cex=1.1)

text(0.05, 0.85, "Regressionsfunktion", pos=4)
text(0.05, 0.80, "turn-diam = 7.1739 + 0.1735 * length", pos=4)

text(0.05, 0.65, "Korrelationskoeffizient r = 0.90", pos=4)

text(0.05, 0.50, "SS-Total", pos=4); text(0.33, 0.5, "= 1361.96", pos=4)
text(0.05, 0.45, "SS-Residual", pos=4); text(0.33, 0.45, "= 259.06", pos=4)
text(0.05, 0.40, "SS-Regression", pos=4); text(0.33, 0.40, "= 1102.90", pos=4)
text(0.05, 0.35, "SS-Total", pos=4); text(0.33, 0.35, "= SS-Regression + SS-Residual", pos=4)

text(0.05, 0.20, paste("Bestimmtheitsma\u00DF"), pos=4)
text(0.40, 0.20, expression(R^2), pos=4)
text(0.44, 0.20, paste(" = 0.81"), pos=4)
