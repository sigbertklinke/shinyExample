data(Boston, package="MASS")
wilcox.test(Boston$medv[Boston$chas==0], 
            Boston$medv[Boston$chas==1])
wilcox.test(medv~chas, Boston)