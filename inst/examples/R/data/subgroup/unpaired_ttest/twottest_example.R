library("MASS") # for Boston Housing data
t.test(Boston$medv[Boston$chas==0], 
       Boston$medv[Boston$chas==1])
t.test(medv~chas, Boston)