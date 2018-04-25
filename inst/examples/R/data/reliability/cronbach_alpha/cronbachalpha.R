pj <- 1:20
rb <- (0:20)/20
alpha <- outer(pj, rb)/(1+outer(pj-1,rb))
pdf("cronbachalpha.pdf", width=10, height=4)
contour(pj, rb, alpha, levels=c(0.5, 0.6, 0.7, 0.9), main="Standardized Cronbachs alpha", ylab="Average correlation", xlab="Number of variables")
dev.off()