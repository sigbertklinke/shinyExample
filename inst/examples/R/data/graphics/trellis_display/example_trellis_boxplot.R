library("MASS")
library("lattice")
# boxplots of medv for chas and by rad
bwplot(medv~factor(chas)|factor(rad), data=Boston)