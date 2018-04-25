x   <- read.csv2("cps78_85.csv")
xs  <- subset(x, year==85, c("lwage", "educ"))
lms <- lm (scale(lwage)~scale(educ), data=xs)
summary(lms)
#
library("QuantPsyc")
lm <- lm (lwage~educ, data=x, subset=(year==85))
lm.beta(lm)