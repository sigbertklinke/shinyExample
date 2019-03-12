data(Boston, package="MASS")
t.test(Boston$medv[Boston$chas==0], 
       Boston$medv[Boston$chas==1])
t.test(medv~chas, Boston)