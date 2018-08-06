library("devtools") # for source_...
tab <- apply(HairEyeColor, 1:2, sum)
source_url("http://www.pmc.ucsc.edu/~mclapham/Rtips/G%20test.txt")
g.test(tab)
g.test(tab, correct="none")