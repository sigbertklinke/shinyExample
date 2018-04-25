library("mlbench")
data(BostonHousing)

stem(BostonHousing$medv)

pdf("rot_hist.pdf", width=3, height=9, bg="transparent")
par(mfrow=c(3,1))
hist(BostonHousing[,14], breaks="Sturges", main="Sturges", bg="transparent")
hist(BostonHousing[,14], breaks="scott", main="Scott", bg="transparent")
hist(BostonHousing[,14], breaks="FD", main="Freedman-Diaconis", bg="transparent")
dev.off()

trad <- table(BostonHousing$rad)
pdf("bostonh_barchart.pdf", bg="transparent")
barplot(trad, main="Boston Housing Data", xlab="Index of accessibility to radial highways", ylab="Number of observations", bg="transparent")
dev.off()

pdf("bostonh_piechart.pdf", bg="transparent")
pie(trad, main="Boston Housing Data", col=rainbow(length(trad)), labels=names(trad), sub="Index of accessibility to radial highways", bg="transparent")
dev.off()

# KernelDensityEstimator.pdf
library("np")
s <- sort(BostonHousing[,13], index.return=T)
x <- BostonHousing[s$ix,13]
r <- -0.01*runif(length(x))-0.005
pdf("KernelDensityEstimator.pdf", bg="transparent")
hist(x, freq=FALSE, ylim=c(-0.015, 0.07), col="gray", xlab="Anteil der Unterschichtbevölkerung pro Bezirk (in %)", ylab="Dichte",  main="Dotplot, Histogramm und Kerndichteschätzer", bg="transparent")
d1<-npudens(x, bws=1.5)
lines(x, fitted(d1), col="red", lwd=2)
d2<-npudens(x, bws=1)
lines(x, fitted(d2), col="blue", lwd=2)
d3<-npudens(x, bws=0.5)
lines(x, fitted(d3), col="green", lwd=2)
points(x,r, cex=0.5)
legend("topright", legend=c("h=1,5", "h=1,0", "h=0,5"), col=c("red", "blue", "green"),
       lwd=2, lty=1, title="Kerndichteschätzer")
dev.off()