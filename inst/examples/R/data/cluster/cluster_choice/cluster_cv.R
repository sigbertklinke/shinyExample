x <- iris[,1:4]
c <- 10
part <- ceiling(c*runif(nrow(x)))

K <- 30
cvk <- rep(0, K)
for (i in 2:K) {
  for (j in 1:c) {
    xj   <- x[part!=j,]
    cl   <- kmeans(xj, i)
    xj   <- x[part==j,]
    dist <- as.matrix(dist(rbind(cl$centers, xj)))
    dist <- dist[i+(1:nrow(xj)),1:i]
    cdist <- apply(dist, 1, min)
    cind  <- apply(dist, 1, which.min)
    cvk[i] <- cvk[i] + sum(cdist)
    #tapply(cdist, cind, mean))
  }
}
plot(2:K, cvk[-1], type="b")