
y <- c(10.1, 28.2, 25.5, 36.2)
barplot(y, ylim=c(0,40), yaxp=c(0, 40, 5), col="purple", main="", 
        ylab="prozentuale relative H\u00E4ufigkeit", xlab="", las=1)
axis(side=1, at=c(0, 0.7, 1.9, 3.1, 4.4, 5.6, 6), tck=0, 
     labels=c(NA, "x1", "x2", "x3", "x4", ">5", NA))
