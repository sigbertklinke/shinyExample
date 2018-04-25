library("boot")
meanboot1 <- function (x, ind) {
  pdf("bootsample.pdf", width=10, height=6)
  par(mfrow=c(1,2))
  hist(x, main="Original sample", xlab="Reticulocyte", breaks=10)
  abline(v=mean(x))
  hist(x[ind], main="Bootstrap sample", , xlab="Reticulocyte", breaks=10)
  abline(v=mean(x[ind]))
  dev.off()
}
set.seed(24961970)
x <- read.csv2("pechstein.csv")
b<-boot(x$Retikulozyten, meanboot1, 1)