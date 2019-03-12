library("rio")
x <- import("https://shinyapps.wiwi.hu-berlin.de/d/BANK2.sav")
# do PCA (covariance)
pc <- prcomp(x)
pc
# what R delivers
summary(pc)
par(mfrow=c(1,2))
plot(pc, main="Scree plot as bar chart")
plot(pc$sdev^2, type="b", main="Scree plot")