x  <- read.csv2("fatalities_statlib.csv")
# see http://lib.stat.cmu.edu/DASL/Stories/hwfatal.html
lm <- lm (US~YR, data=x)
summary(lm)
plot(x$YR, x$US)
abline(lm, col="red")
#
library("car")
durbinWatsonTest(lm)
#
library("lmtest")
dwtest(lm)
dwtest(lm, alternative="two.sided")