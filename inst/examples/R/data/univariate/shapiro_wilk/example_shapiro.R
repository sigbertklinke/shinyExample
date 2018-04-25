library("MASS")
shapiro.test(Boston$medv)
#
library("DescTools")
ShapiroFranciaTest(Boston$medv)