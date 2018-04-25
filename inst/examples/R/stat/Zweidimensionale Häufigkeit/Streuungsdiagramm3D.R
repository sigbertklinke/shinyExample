if(!require("scatterplot3d")) install.packages("scatterplot3d"); library("scatterplot3d")
attach(mtcars)
scatterplot3d(wt,disp,mpg, col.grid="white", color="black", pch=16, xlab="", ylab="", zlab="", lwd=3)