library("MASS")  # for Boston Housing data
# ggplot2
library("ggplot2")
ggplot(Boston, aes(x=lstat, y=medv)) + geom_point(shape=1)