
par(mar=c(5, 4, 4, 2) + 0.1)
par(mfrow=c(1,2))

x = c(1164, 998, 535, 5822, 968, 3174, 17783, 7562, 11853, 10744, 5499, 11535, 9088, 4775, 4193, 2884, 5029, 685, 708, 1606, 2450, 622, 4392, 5706, 1936, 6255, 3347, 5976, 11366, 3726, 4762, 4021, 2613, 2359, 4481, 3301, 16370, 826, 1005, 509, 3231, 1450, 3187, 1645, 936, 4409, 2687, 26365, 521, 1054)

y = c(12.6, 12.1, 7.6, 99.5, 78.3, 70.4, 443.3, 169.4, 106, 145.9, 107.5, 251.1, 346.6, 33.1, 89.1, 28.6, 200.8, 6.5, 17.1, 57.3, 75.1, 105.5, 338.6, 92, 27.3, 53, 60.1, 95.8, 186.1, 72.8, 82, 50.3, 19, 45.6, 140.8, 54.9, 134.1, 22.3, 20.5, 22, 129.1, 66.1, 120.2, 53.1, 188.4, 93.5, 102.5, 206.9, 71.8, 63.3)

plot(x, y, pch="", xlab="population * E^3", ylab="robbery * E^2", font.lab=2, cex.lab=1.4, xaxt="n", yaxt="n"); #summary(lm(y~x))
axis(1, at=seq(0,25000,by=5000), label=seq(0,25,by=5))
axis(2, at=seq(0,400,by=100), label=seq(0,4,by=1), las=2)

lines(rep(x[37], 2), c(-10, 48.1134+0.0112*x[37]), col="blue", lwd=2)
lines(c(-700, x[37]), rep(y[37], 2), col="cyan", lwd=2)
lines(c(-700, x[37]), rep(48.1134+0.0112*x[37], 2), col="blue", lwd=2)
points(x[-37], y[-37], pch=16, col="red", cex=1.25)
abline(48.1134, 0.0112, lwd=3)
points(x[37], y[37], pch=19, cex=2, col="green3")
text(18000, 125, expression(x[37]), cex=1.75)

par(mar=rep(0,4))
plot.new()
par(cex=1.1)

text(0.05, 0.85, "Regressionsfunktion", pos=4)
text(0.05, 0.80, "robbery = 48.1134 + 0.0112 * popul.", pos=4)

text(0.05, 0.65, "Korrelationskoeffizient r = 0.62", pos=4)

text(0.05, 0.50, "SS-Total", pos=4); text(0.33, 0.5, "= 407495.40", pos=4)
text(0.05, 0.45, "SS-Residual", pos=4); text(0.33, 0.45, "= 249210.77", pos=4)
text(0.05, 0.40, "SS-Regression", pos=4); text(0.33, 0.40, "= 158284.63", pos=4)
text(0.05, 0.35, "SS-Total", pos=4); text(0.33, 0.35, "= SS-Regression + SS-Residual", pos=4)

text(0.05, 0.20, paste("Bestimmtheitsma\u00DF"), pos=4)
text(0.40, 0.20, expression(R^2), pos=4)
text(0.44, 0.20, paste(" = 0.39"), pos=4)
