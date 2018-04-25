library("psych")
# principal component extraction
pc  <- fa(bfi[,1:25], nfactors=5)
pdf("rotation.pdf", width=5, height=5)
col <- ifelse(apply(abs(pc$loadings[,1:2])<0.5, 1, all), "red", "blue")
plot(pc$loadings[,1:2], pch=19, asp=T, xlab="", ylab="", col=col,
		 main="First two factor loadings for BFI data", xlim=c(-1,1), ylim=c(-1,1))
rect(-0.5,-0.5,0.5,0.5, border='grey')
abline(v=0)
abline(h=0)
dev.off()