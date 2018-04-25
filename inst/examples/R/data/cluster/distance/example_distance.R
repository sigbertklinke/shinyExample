library("cluster")
zfaithful <- apply(faithful, 2, scale)
# euclidean distance
heatmap(as.matrix(dist(zfaithful)))
heatmap(as.matrix(daisy(zfaithful)))
# manhattan
heatmap(as.matrix(dist(zfaithful, 'manhattan')))
heatmap(as.matrix(daisy(zfaithful, 'manhattan')))
# gower
heatmap(as.matrix(daisy(zfaithful, 'gower')))