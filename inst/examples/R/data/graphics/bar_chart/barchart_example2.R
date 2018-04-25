library("MASS") # for Boston Housing da
library("lattice")
tab2 <- table(Boston$rad, Boston$chas)
ldat <- data.frame(rad=rep(rownames(tab2), 2), 
                   count=as.vector(tab2), 
                   chas=c(rep(colnames(tab2)[1],9), 
                          rep(colnames(tab2)[2],9)))
barchart(count~rad|chas, data=ldat)
#
library("ggplot2")
ggplot(Boston, aes(x=factor(rad))) + geom_bar()