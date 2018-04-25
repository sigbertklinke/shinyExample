library("MASS")
library("lattice")
# boxplots for chas and rad
bwplot(medv~factor(chas)|factor(rad), data=Boston)
# scatterplot of lstat and medv for rad
xyplot(medv~lstat|factor(rad), data=Boston)
# scatterplot of lstat and medv for rm strips
rmstrip <- equal.count(Boston$rm, number=9)
xyplot(medv~lstat|rmstrip, data=Boston)