data(Boston, package="MASS")
# Kolmogorov-Smirnov test
ks.test(Boston$medv, "pnorm", mean=mean(Boston$medv), 
				sd=sd(Boston$medv))
# Lilliefors test
library("nortest")
lillie.test(Boston$medv)