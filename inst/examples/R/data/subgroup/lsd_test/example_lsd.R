library("MASS") # for Boston Housing data
# ANOVA 
fit <- aov(medv~rad, data=Boston)
# LSD test
library("agricolae")
LSD.test(fit, "rad", console=T)