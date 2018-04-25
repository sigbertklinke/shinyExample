library("MASS")
# Levene test
library("car")
leveneTest(medv~factor(rad), data=Boston, center=mean)
library("lawstat")
levene.test(Boston$medv, Boston$rad, location="mean")
# Brown-Forsythe test
leveneTest(medv~factor(rad), data=Boston)
levene.test(Boston$medv, Boston$rad)