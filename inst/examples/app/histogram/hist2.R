library("MASS")
x <- Boston$medv
b <- seq(min(x), max(x), length.out=value(input$breaks)+1)
hist(x, breaks=b)