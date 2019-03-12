data(Boston, package="MASS")
boxplot(medv~rad, data=Boston, notch=T, varwidth=T)
#
tapply(Boston$medv, factor(Boston$rad), mean)