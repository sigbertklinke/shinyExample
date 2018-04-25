library("MASS")   # for Boston Housing data

aggregate(Boston$medv, list(Boston$rad), mean)
aggregate(medv~rad, data=Boston, mean)
aggregate(Boston$medv, list(Boston$rad, Boston$chas), mean)
aggregate(medv~rad+chas, data=Boston, mean)
aggregate(Boston, list(Boston$rad), mean)
aggregate(Boston, list(Boston$rad, Boston$chas), mean)

by(Boston$medv, Boston$rad, mean)
by(Boston, Boston$rad, mean) # warning
by(Boston$medv,  list(Boston$rad, Boston$chas), mean)
by(Boston, list(Boston$rad, Boston$chas), mean) # warning