## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  library("MASS")
#  x <- Boston$medv
#  hist(x)

## ----eval=FALSE----------------------------------------------------------
#  library("shinyExample")
#  makeShinyApp(output=plotOut('plot', file='hist0.R'))

## ----eval=FALSE----------------------------------------------------------
#  library("MASS")
#  x <- Boston$medv
#  hist(x, breaks=value(input$breaks))

## ----eval=FALSE----------------------------------------------------------
#  library("shinyExample")
#  elem <- sliderIn('breaks', 'Number of bins', min=1, max=50, value=10)
#  makeShinyApp(input=elem,
#               output=plotOut('plot', file='hist1.R'))

## ----eval=FALSE----------------------------------------------------------
#  library("MASS")
#  x <- Boston$medv
#  b <- seq(min(x), max(x), length.out=value(input$breaks)+1)
#  hist(x, breaks=b)

## ----eval=FALSE----------------------------------------------------------
#  library("shinyExample")
#  elem <- sliderIn('breaks', 'Number of bins', min=1, max=50, value=10)
#  makeShinyApp(input=elem,
#               output=plotOut('plot', file='hist2.R'))

## ----eval=FALSE----------------------------------------------------------
#  gettext("Number of bins"); # 1

## ----eval=FALSE----------------------------------------------------------
#  library("MASS")
#  x <- Boston$medv
#  b <- seq(min(x), max(x), length.out=value(input$breaks)+1)
#  hist(x, breaks=b)
#  if(value(input$rug)) rug(x)

## ----eval=FALSE----------------------------------------------------------
#  library("shinyExample")
#  elem1 <- sliderIn('breaks', 'Number of bins', min=1, max=50, value=10)
#  elem2 <- checkboxIn('rug', 'Show observations')
#  makeShinyApp(input=list(elem1, elem2),
#               output=plotOut('plot', file='hist3.R'))

## ----echo=FALSE----------------------------------------------------------
help("sliderIn", help_type="html")

