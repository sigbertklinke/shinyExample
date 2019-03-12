# run example_mar.R before
library("mice")
# run NORM
xmar$chas <- factor(xmar$chas)
xmar$rad <- factor(xmar$rad)
mobj <- mice(xmar)
# compute linear regressions
models = list()
for (i in 1:5) models[[i]] <- lm(medv~lstat, 
                                 data=complete(mobj, i)) 
# look at one model
summary(models[[1]])