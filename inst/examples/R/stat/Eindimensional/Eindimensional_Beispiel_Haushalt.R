y <- c(7.1, 14.7, 17.0, 16.8, 44.4)
x <- c(6.7, 17.7, 22.5, 19.7, 33.3)
par(mfrow=c(1,2))
par(mfg=c(1,1))
barplot(y, ylim=c(0,45), yaxp=c(0, 45, 9), col="gray", main="1900", 
        ylab="prozentuale relative H\u00E4ufigkeit", xlab="Haushaltsgr\u00F6\u00DFe", las=1)
axis(side=1, at=c(0, 0.7, 1.9, 3.1, 4.4, 5.6, 6), tck=0, 
     labels=c(NA, "1", "2", "3", "4", ">5", NA))
par(mfg=c(1,2))
barplot(x, ylim=c(0, 45), yaxp=c(0, 45, 9), col="gray", main="1925", 
        ylab="prozentuale relative H\u00E4ufigkeit", xlab="Haushaltsgr\u00F6\u00DFe", las=1)
axis(side=1, at=c(0, 0.7, 1.9, 3.1, 4.4, 5.6, 6), tck=0, 
     labels=c(NA, "1", "2", "3", "4", ">5", NA))