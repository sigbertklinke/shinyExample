library("igraph")
library("xtable")
library("scatterplot3d")
library("gplots")


set.seed(0)
x<-c(5,2,-2,-3,-2,-2,1,1)
y<-c(-3,-4,-1,0,-2,4,2,4)
n <- length(x)
vertices  <- data.frame(x=x, y=y, row.names=letters[1:n])
adjacency <- as.matrix(dist(vertices))
xtable(adjacency)
defpar <- par()

# Data points
plot(vertices, pch=19)
text(vertices, rownames(vertices), pos=4)
box()
# Graph with distances
graph <- graph.adjacency(adjacency, mode="undirected", weighted=TRUE)
plot(graph, edge.label=round(E(graph)$weight, 1))
box()

par(mar=c(0,0,0,0))
# Epsilon neighbourhood with eps=5
graphe<-delete.edges(graph, which(E(graph)$weight>5))
plot(graphe, edge.label=round(E(graphe)$weight, 1))
box()

# k-nn neigbourhood with k=3
distk <- apply(adjacency, 1, function(x) { sort(x,partial=3)[3] })
keep  <- sweep(adjacency, 1, distk, function(x, v) { x<=v })
keep1 <- (keep | t(keep))
keep2 <- (keep & t(keep))
adjk1 <- adjacency
adjk1[!keep1] <- NA
graphk1 <- graph.adjacency(adjk1, mode="undirected", weighted=TRUE)
graphk1 <- delete.edges(graphk1, which(is.na(E(graphk1)$weight)))
plot(graphk1, edge.label=round(E(graphk1)$weight, 1))
box()
# mutual k-nn neigbourhood with k=3
adjk2 <- adjacency
adjk2[!keep2] <- NA
graphk2 <- graph.adjacency(adjk2, mode="undirected", weighted=TRUE)
graphk2 <- delete.edges(graphk2, which(is.na(E(graphk2)$weight)))
plot(graphk2, edge.label=round(E(graphk2)$weight, 1))
box()

xtable(diag(colSums(adjk2, na.rm=T))-adjk2)

# Gaussian similarity with sigma=3
graphf<-graph
E(graphf)$weight <- exp(-0.5*(E(graphf)$weight/3)^2)
plot(graphf, edge.label=round(E(graphf)$weight, 1))
box()

# Eigenvalues of adjk2
adjk2[is.na(adjk2)] <- 0
d <- colSums(adjk2)

laplace <- diag(n)-diag(1/d)%*%adjk2
laplace[is.na(laplace)] <- 0
ep <- eigen(laplace)
sx <- sort(ep$values, index.return=T)
par(mar=defpar$mar)
plot(sx$x, ylab="Eigenvalue", pch=19)

scatterplot3d(ep$vectors[,sx$ix[1:3]], pch=19, xlab=expression(EV[1]), ylab=expression(EV[2]), zlab=expression(EV[3]))
xtable(ep$vectors[,sx$ix[1:3]])


# Iris Daten
siris <- iris[,1:4]
irisdist <- as.matrix(dist(siris))

#library("ape")
#max(mst(irisdist)*irisdist)

res<-heatmap(irisdist, symm=T, col=gray((0:16)/16), keep.dendro=T)
distk <- apply(irisdist, 1, function(x) { sort(x,partial=25)[25] })
keep  <- sweep(irisdist, 1, distk, function(x, v) { x<=v })
keep1 <- (keep | t(keep))
keep2 <- (keep & t(keep))
no.clusters(graph.adjacency(keep1, mode="undirected"))
heatmap(keep2+0, symm=T,  col=c("white", "black"))

irisdist[!keep1] <- 0
d <- colSums(irisdist)
laplace <- diag(150)-diag(1/d)%*%irisdist
l2 <- laplace
l2[abs(l2)<0.0001] <- 1e9
heatmap.2(l2,  trace="none", col=gray((0:16)/16), symm=T, dendrogram="none", Rowv=res$rowInd)

ep <- eigen(laplace, symmetric=T)
sx <- sort(ep$values, index.return=T)
par(mar=defpar$mar)
plot(sx$x, ylab="Eigenvalue", pch=19, cex=0.25)

kcl <- kmeans(ep$vectors[,sx$ix[1:3]],3)
table(iris[,5], kcl$cluster)
pairs(siris, col=kcl$cluster)
library("MASS")
parcoord(siris, col=kcl$cluster)