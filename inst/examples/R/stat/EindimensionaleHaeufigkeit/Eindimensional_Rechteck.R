y <- matrix(data=c(10.1, 28.2, 25.5, 36.2,0,0,0,0), nrow = 4, ncol = 2 )
barplot(y, ylim=c(0,100), yaxp=c(0, 100, 5), col=c("tomato2","yellow1","dodgerblue","springgreen3"), main="", 
        ylab="prozentuale relative H\u00E4ufigkeit", xlab="", las=1)
axis(side=4, at=c(5.05,24.2,51.05,81.9), labels=c("x1","x2","x3","x4"))
