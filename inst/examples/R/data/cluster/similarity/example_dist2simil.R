library("proxy")
d <- as.matrix(dist(faithful))
heatmap(d)
# distances to similarities
s <- pr_dist2simil(d)
heatmap(s)
# distance and similarity measures in proxy
summary(pr_DB)
pr_DB$get_entry('Jaccard')