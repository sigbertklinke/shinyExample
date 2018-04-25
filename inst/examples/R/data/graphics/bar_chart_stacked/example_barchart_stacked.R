library("MASS") # for Boston Housing data
tab <- table(Boston$chas, Boston$rad)
barplot(tab)
#
library("lattice")
tab2 <- table(Boston$rad,  Boston$chas)
barchart(tab2)
#
library("ggplot2")
d <- ggplot(Boston, aes(x=factor(rad),fill=factor(chas))) 
d + geom_bar(position="stack")