library("MASS")
x  <- Boston[,-c(4,9)]
lm <- lm (medv~., data=x)
#
library("car")
vif(lm)
#
library("perturb")
colldiag(lm)