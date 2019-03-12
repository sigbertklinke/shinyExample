data(Boston, package="MASS")
library("glmnet")
x <- as.matrix(Boston[,-c(9,14)])
y <- Boston[,14]
# find lambda
lmenet<- cv.glmnet(x, y, alpha=0.5)
plot(lmenet)
lmenet$lambda.min
lmenet$lambda.1se
# compare coefficients
lm(y~x)
coef(lmenet, s="lambda.1se")
