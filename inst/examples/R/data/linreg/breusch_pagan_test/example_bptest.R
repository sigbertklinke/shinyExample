library("rio")
x  <- import("https://shinyapps.wiwi.hu-berlin.de/d/StaedteMietenR.sav")
x  <- x[complete.cases(x),]
lm <- lm (Miete~Fläche, data=x)
summary(lm)
plot(x$Fläche, residuals(lm))
abline(h=0, col="red")
#
library("lmtest")
bptest(Miete~Fläche, data=x)