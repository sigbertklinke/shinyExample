library("foreign")
x <- read.spss("BOSTONC.SAV", to.data.frame=T)
plot(x$LON, x$LAT, main="Boston school districts")
#
col <- ifelse(x$CHAS=="bounds river", "red", "black")
plot(x$LON, x$LAT, main="Boston school districts", 
     pch=19, col=col)
#
library("lattice")
xyplot(LAT~LON|CHAS, data=x, pch=19)
#
library("ggplot2")
d <-ggplot(x, aes(x=LON, y=LAT, colour=CHAS)) 
d + geom_point(shape=19) 