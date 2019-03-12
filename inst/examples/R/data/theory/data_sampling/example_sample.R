data(Boston, package="MASS")
mean(Boston$medv) # true mean in the population
#
library("DescTools")
# random sample of size 100
ind <- sample(1:nrow(Boston), size=100)
MeanCI(Boston$medv[ind])
# biased sample of size 100
ind <- sample(1:nrow(Boston), size=100, prob=Boston$rm>6.5)
MeanCI(Boston$medv[ind])
#
# There is a population for each sample, 
# but most likely it is not the population of interest!