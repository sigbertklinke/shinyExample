library("MASS") # for Boston Housing data
# ANOVA 
fit <- aov(medv~rad, data=Boston)
# Scheffe test
library("agricolae")
scheffe.test(fit, "rad", console=T)