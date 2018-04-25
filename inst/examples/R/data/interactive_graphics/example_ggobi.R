# Do not run 
library("MASS") # for Boston Housing data
if (interactive()) {
  library("rggobi")
  g <- ggobi(Boston)
  # now do some brushing
  col <- glyph_colour(g["Boston"])
  table(col)
}