library("MASS")
library("lattice")
# scatterplots of lstat and medv by rm strips
rmstrip <- equal.count(Boston$rm, number=9)
xyplot(medv~lstat|rmstrip, data=Boston)