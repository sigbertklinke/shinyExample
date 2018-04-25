library("MASS") # for Boston Housing data
tab <- table(Boston$rad)
# standard barchart with own labels
at<-barplot(tab, axes=F)
axis(1, at=at, labels=names(tab))