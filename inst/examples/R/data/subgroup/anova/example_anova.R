library("MASS") # for Boston Housing data
# check number of observations
tapply(Boston$medv, Boston$rad, length)
# check normality
tapply(Boston$medv, Boston$rad, shapiro.test)
# check variances
tapply(Boston$medv, Boston$rad, var)
# check skewnesss
library("DescTools")
tapply(Boston$medv, Boston$rad, Skew)
# ANOVA :(
summary(aov(medv~rad, data=Boston))