data(Boston, package="MASS")
# ANOVA 
Boston$rad	<- as.factor(Boston$rad)
fit <- aov(medv~rad, data=Boston)
# HSD test
TukeyHSD(fit, "rad")
#
library("agricolae")
HSD.test(fit, "rad", console=T)