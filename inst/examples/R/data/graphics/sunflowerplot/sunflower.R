library("hexbin")

set.seed(0)
x <- rnorm(1000)
y <- rnorm(1000)

hbin <- hexbin(x, y)
qbin <- cbind(round(x, 0), round(y, 0))

pdf("sunflower1.pdf", bg="transparent")
sunflowerplot(qbin,  main = "Sunflower Plot of Rounded N(0,1)")
dev.off()

pdf("sunflower2.pdf", bg="transparent")
plot(hbin, style = "nested.lattice",  main = "Sunflower Plot of Rounded N(0,1)")
dev.off()
