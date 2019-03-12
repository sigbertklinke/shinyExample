data(Boston, package="MASS")
# ANOVA 
fit <- aov(medv~rad, data=Boston)
# LSD test
library("agricolae")
LSD.test(fit, "rad", p.adj="bonferroni", console=T)