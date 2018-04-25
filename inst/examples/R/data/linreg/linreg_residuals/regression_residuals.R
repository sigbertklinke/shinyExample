x  <- read.csv2("cps78_85.csv")
lm <- lm(lwage~educ+exper, data=x, subset=(year==85))
par(mfrow=c(2,2))
plot(lm)