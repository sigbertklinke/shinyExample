x=seq(0,1,0.05)
y=x
fxy=outer(x,y,function(x,y) (x+3*y)/2)
persp(x,y,fxy,main="f(x,y) = (x+3y)/2", xlab="x", ylab="y", zlab="f(x,y)", xlim=c(0,1), ylim=c(0,1),zlim=c(0,2.2), theta=-40, phi=25, ticktype="detailed", nticks=5, bty="l", col="purple", box=TRUE, axes=TRUE, font.lab=2, font.axis=2, scale=TRUE)
