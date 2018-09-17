x <- c(30,30,100,50,100,80,50,100,250,180,330,200,400,500,600)
y <- c(10,15,15,20,20,25,30,30,30,35,35,40,45,50,50)
plot(x,y, pch=16, xlab="Jahresmiete (in Tsd.)", ylab="Jahresgewinn (in Mio)", las=1, lwd=3)
abline(h=30, col="red", lty=3)