x <- read.csv2("cps78_85.csv")
lm <- lm(lwage~educ, data=x, subset=(year==85))
summary(lm)