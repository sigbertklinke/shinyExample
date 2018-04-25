library("foreign")
x  <- read.spss("StaedteMietenR.sav", to.data.frame = T)
lm <- lm (Miete~Flaeche, data=x)
summary(lm)
plot(x$Flaeche, residuals(lm))
abline(h=0, col="red")
#
library("lmtest")
bptest(Miete~Flaeche, data=x)