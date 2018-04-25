x <- c(0:9)
par(mfrow=c(5,1), mar=c(3, 6, 3, 5)-1)
#1.Grafik
par(mfg=c(1,1))
WVert<- dbinom(x, 9, 0.1)
plot(WVert, col="WHITE", xaxt="n", yaxt="n", ylab="f(X)", ylim=c(0, 0.4), xlim=c(0, 9), xlab="", 
     main="p=0.1", las=1, font.lab=2)
lines(c(0:9), WVert, type="h", lwd=5, col="BLUE")
axis(side=1, labels=c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), tck=0)
axis(side=2, at=c(0, 0.1, 0.2, 0.3, 0.4), labels=c(NA, NA, 0.2, NA, 0.4), las=1)

#2.Grafik
par(mfg=c(2,1))
WVert<- dbinom(x, 9, 0.25)
plot(WVert, col="WHITE", xaxt="n", yaxt="n", ylab="f(X)", ylim=c(0, 0.4), xlim=c(0, 9), xlab="", 
     main="p=0.25", las=1, font.lab=2)
lines(c(0:9), WVert, type="h", lwd=5, col="BLUE")
axis(side=1, labels=c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), tck=0)
axis(side=2, at=c(0, 0.1, 0.2, 0.3, 0.4), labels=c(NA, NA, 0.2, NA, 0.4), las=1)

#3.Grafik
par(mfg=c(3,1))
WVert<- dbinom(x, 9, 0.5)
plot(WVert, col="WHITE", xaxt="n", yaxt="n", ylab="f(X)", ylim=c(0, 0.4), xlim=c(0, 9), xlab="", 
     main="p=0.5", las=1, font.lab=2)
lines(c(0:9), WVert, type="h", lwd=5, col="BLUE")
axis(side=1, labels=c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), tck=0)
axis(side=2, at=c(0, 0.1, 0.2, 0.3, 0.4), labels=c(NA, NA, 0.2, NA, 0.4), las=1)

#4.Grafik
par(mfg=c(4,1))
WVert<- dbinom(x, 9, 0.75)
plot(WVert, col="WHITE", xaxt="n", yaxt="n", ylab="f(X)", ylim=c(0, 0.4), xlim=c(0, 9), xlab="", 
     main="p=0.75", las=1, font.lab=2)
lines(c(0:9), WVert, type="h", lwd=5, col="BLUE")
axis(side=1, labels=c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), tck=0)
axis(side=2, at=c(0, 0.1, 0.2, 0.3, 0.4), labels=c(NA, NA, 0.2, NA, 0.4), las=1)

#5.Grafik
par(mfg=c(5,1))
WVert<- dbinom(x, 9, 0.9)
plot(WVert, col="WHITE", xaxt="n", yaxt="n", ylab="f(X)", ylim=c(0, 0.4), xlim=c(0, 9), xlab="", 
     main="p=0.9", las=1, font.lab=2)
lines(c(0:9), WVert, type="h", lwd=5, col="BLUE")
axis(side=1, labels=c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA), tck=0)
axis(side=2, at=c(0, 0.1, 0.2, 0.3, 0.4), labels=c(NA, NA, 0.2, NA, 0.4), las=1)