library("fpc")
cl <- dbscan(faithful, 0.05, scale=T)
col <- c('grey', rainbow(max(cl$cluster)))
plot(faithful, pch=19, col=col[1+cl$cluster])
#
cl <- dbscan(faithful, 0.1, scale=T)
col <- c('grey', rainbow(max(cl$cluster)))
plot(faithful, pch=19, col=col[1+cl$cluster])
#
cl <- dbscan(faithful, 0.15, scale=T)
col <- c('grey', rainbow(max(cl$cluster)))
plot(faithful, pch=19, col=col[1+cl$cluster])