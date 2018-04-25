library("spdep")
data("boston")
#
col <- ifelse(boston.c$CHAS==1, "red", "black")
plot(boston.c$LON, boston.c$LAT, main="Boston school districts", pch=19, col=col)
#
library("lattice")
xyplot(LAT~LON|CHAS, data=boston.c, pch=19)
#
library("ggplot2")
d <-ggplot(boston.c, aes(x=LON, y=LAT, colour=CHAS)) 
d + geom_point(shape=19) 