library("MASS")   # for Boston Housing data
cor <- cor(Boston[,c(-4,-9)])
#
library("ggplot2")
library("reshape2")
mcor <- melt(cor)
d <- ggplot(mcor, aes(x=Var1, y=Var2, z=value)) 
d <- d+geom_tile(aes(fill= value))
d + scale_fill_gradient(low = "white", high = "steelblue")