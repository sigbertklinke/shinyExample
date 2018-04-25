library("MASS") # for Boston Housing data
library("ggplot2")
d <- ggplot(Boston, aes(x=factor(rad),fill=factor(chas))) 
d + geom_bar(position="stack")