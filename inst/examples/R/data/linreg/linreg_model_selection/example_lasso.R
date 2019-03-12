data(Boston, package="MASS")
library("glmnet")
x <- as.matrix(Boston[,-c(9,14)])
y <- Boston[,14]
# find lambda
lmlasso <- cv.glmnet(x, y)
plot(lmlasso)
#
lmlasso <- cv.glmnet(x, y, lambda=seq(0, 1, 0.001))
plot(lmlasso)
lmlasso$lambda.min
lmlasso$lambda.1se
# compare coefficients
lm(y~x)
coef(lmlasso, s="lambda.1se")
