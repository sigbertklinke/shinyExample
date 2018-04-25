library("MASS") # for Boston Housing data
library("sm")
sm.density.compare(Boston$medv, factor(Boston$chas), 
       col=c("red", "blue"), lty=c("solid", "solid"), lwd=2)
legend("topright", legend=c("CHAS==0", "CHAS==1"), 
       col=c("red", "blue"), lwd=2)