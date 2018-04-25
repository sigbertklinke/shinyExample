library("MASS") # for Boston Housing data
tab <- table(Boston$rad)

# bar chart as needles (should not be used!)
plot(tab)

# standard barchart with own labels
at<-barplot(tab, axes=F)
axis(1, at=at, labels=names(tab))