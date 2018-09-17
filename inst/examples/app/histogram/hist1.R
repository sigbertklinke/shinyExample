library("MASS")
x <- Boston$medv
hist(x, breaks=value(input$breaks))