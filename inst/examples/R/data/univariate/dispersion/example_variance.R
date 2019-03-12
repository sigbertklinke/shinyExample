data(Boston, package="MASS")
# variance an standard deviation
var(Boston$medv)
sd(Boston$medv)
# range
diff(range(Boston$medv))
# coefficient of variation
sd(Boston$medv)/mean(Boston$medv)