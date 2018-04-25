library("MASS") # for Boston Housing data
library("lattice")
tab2 <- table(Boston$rad, Boston$chas)
ldat <- data.frame(rad=rep(rownames(tab2), 2), 
                   count=as.vector(tab2), 
                   chas=c(rep(colnames(tab2)[1],9), 
                          rep(colnames(tab2)[2],9)))
barchart(count~rad, group=chas, data=ldat, ylim=c(0, 5+max(ldat$count)))