library("lattice")
ad <- read.csv2("anscombe.csv")
pdf("anscombe.pdf", bg="transparent")
xyplot(y~x|id, data=ad, main="Anscombe quartet", panel=function(x, y){
  panel.xyplot(x, y)
  panel.lmline(x, y)
})
dev.off()