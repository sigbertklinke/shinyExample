library("MASS")  # for Boston Housing data
# standard graphics
plot(Boston$lstat, Boston$medv)

# lattice
library("lattice")
xyplot(medv~lstat, data=Boston)

# ggplot2
library("ggplot2")
ggplot(Boston, aes(x=lstat, y=medv)) + geom_point(shape=1)