library("foreign")
x <- read.spss("BANK2.sav", to.data.frame=T)
par(mfrow=c(1,2))
# do PCA (correlation)
pc <- prcomp(x, center=T, scale=T)
summary(pc)
plot(pc$sdev^2, type="b", main="Scree plot")
#
library("psych")
ppc<-principal(x, rotate="none")
ppc
scree(x)