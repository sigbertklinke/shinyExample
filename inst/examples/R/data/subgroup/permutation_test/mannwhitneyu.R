r1 <- c(3,4,5,6,6,5,7,7,8,9)
pdf("mannwhitneyu.pdf", width=10, height=3)
barplot(table(r1)/length(r1), xlab="r1", ylab="percent", main="Distribution of R1 under H0")
dev.off()