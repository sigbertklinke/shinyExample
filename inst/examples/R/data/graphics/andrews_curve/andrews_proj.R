library("rgl")
t <- 2*pi*(0:36)/36
c <- cbind(rep(1/sqrt(2), length(t)), cos(t), sin(t))
plot3d(c, type="l", xlab="x1", ylab="x2", zlab="x3")
plot3d(-c, type="l", add=T)

t <- 2*pi*(0:18)/18
c <- cbind(rep(1/sqrt(2), length(t)), cos(t), sin(t))
for (i in 1:nrow(c)) {
  plot3d(rbind(c[i,], -c[i,]), type="l", add=T)
}
#rgl.postscript("andrews_proj.pdf","pdf") 