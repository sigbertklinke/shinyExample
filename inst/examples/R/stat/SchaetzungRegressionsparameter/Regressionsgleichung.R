x = c(30,20,60,80,40,50,60,30,70,60)
y = c(73,50,128,170,87,108,135,69,148,132)
model = lm(y~x)

par(mfrow=c(1,2))
plot(x, y, xlab=paste("Losgr", "\u00F6", "\u00DF", "e", sep=""), ylab="Arbeitszeit", pch=8, yaxt="n", main="Lineare Regression")
axis(2, at=c(50,100,150))
abline(10, 2, col="green", lwd=2)

plot(x, model$resid, xlab=paste("Losgr", "\u00F6", "\u00DF", "e", sep=""), ylab="Residuen", pch=8, xlim=c(20,80), ylim=c(-8, 8), yaxt="n", main="Plot der Residuen")
axis(2, at=seq(-8, 8, by=1))
abline(0, 0, col="green", lwd=2)
