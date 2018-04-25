library("MASS")
pairs(~rm+lstat+medv, data=Boston, cex=0.5)

# lattice: makes no sense

# ggplot2
library("ggplot2")
library("GGally")
ggpairs(Boston, columns=c(6,13,14))