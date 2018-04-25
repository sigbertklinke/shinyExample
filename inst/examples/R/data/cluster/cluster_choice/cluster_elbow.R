totvar <- sum(apply(iris[,1:4], 2, var))

K <- 10
bss <- rep(NA, K)
pdf("cluster_elbow.pdf", width=10, height=4)
par(mfrow=c(1,3))
for (i in 1:K) {
  cl <- kmeans(iris[,1:4], i)
  bss[i] <- cl$betweenss/nrow(iris)
}
plot(bss, type="b", ylab="Explained total variance (abs.)", ylim=c(0,totvar), xlab="Number of clusters",
     main="Iris data with kmeans (run 1)")
bss <- rep(NA, K)
for (i in 1:K) {
  cl <- kmeans(iris[,1:4], i)
  bss[i] <- cl$betweenss/nrow(iris)
}
plot(bss/totvar, type="b", ylab="Explained total variance (rel.)", ylim=c(0,1), xlab="Number of clusters",
     main="Iris data with kmeans (run 2)")
bss <- rep(NA, K)
for (i in 1:K) {
  cl <- kmeans(iris[,1:4], i)
  bss[i] <- cl$betweenss/nrow(iris)
}
plot(1-bss/totvar, type="b", ylab="Unexplained total variance (rel.)", ylim=c(0,1), xlab="Number of clusters",
     main="Iris data with kmeans (run 3)")
dev.off()