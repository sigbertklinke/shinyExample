data(Boston, package="MASS")
library("agricolae")
# ANOVA 
Boston$rad	<- as.factor(Boston$rad)
fit <- aov(medv~rad, data=Boston)
# Student-Newman-Keuls test
SNK.test(fit, "rad", console=T)
# Duncan test
duncan.test(fit, "rad", console=T)