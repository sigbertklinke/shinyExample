data(Boston, package="MASS")
shapiro.test(Boston$medv)
#
library("DescTools")
ShapiroFranciaTest(Boston$medv)