library("MASS")
library("lattice")
# scatterplots of lstat and medv by rad
xyplot(medv~lstat|factor(rad), data=Boston)