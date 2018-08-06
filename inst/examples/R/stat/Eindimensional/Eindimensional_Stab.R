y <- c(10.1, 28.2, 25.5, 36.2)
names (y) <- c("x1", "x2", "x3", "x4")
plot(y, type='h', xlab='x', xaxt='n',col=c("tomato2","yellow2","dodgerblue","springgreen3"), ylab="prozentuale relative H\u00E4ufigkeit",lwd=4)
axis(1, at=1:length(y), labels=names(y), cex.axis=0.75)
