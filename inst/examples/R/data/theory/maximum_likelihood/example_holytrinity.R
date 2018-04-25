library("MASS")
library("lmtest")
lm0 <- lm(medv~lstat, data=Boston) 
lm1 <- lm(medv~lstat+rm, data=Boston)
# likelihood ratio test
lrtest(lm0, lm1)
# score test
anova(lm1)
anova(lm0, lm1, test="Rao")
# wald test
waldtest(lm1)
waldtest(lm0, lm1)