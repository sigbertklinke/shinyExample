x = c(80, 220, 140, 120, 180, 100, 200, 160)
y = c(0.6, 6.7, 5.3, 4.0, 6.55, 2.15, 6.6, 5.75)

model = lm(y~x)

par(mfrow=c(1,2))

plot(x, y, xlab=paste("Streckenpl", "\u00E4", "ne (in 1000)", sep=""), ylab=paste("Zuwachs an Fahrg", "\u00E4", "sten (in 1000)", sep=""), pch=8, yaxt="n", xaxt="n", ylim=c(0,8), main="Lineare Regression")
axis(1, at=c(100,150,200))
axis(2, at=c(0,2,4,6,8))
abline(-1.816071, 0.043482, col="green", lwd=2)

plot(x, model$resid, xlab=paste("Streckenpl", "\u00E4", "ne (in 1000)", sep=""), ylab="Residuen", xaxt="n", yaxt="n", main="Plot der Residuen", pch=8)
axis(1, at=c(100,150,200))
axis(2, at=seq(-1,1,by=0.5))
abline(0, 0, col="green", lwd=2)