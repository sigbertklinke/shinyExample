library("rio")
# Read Excel data
x <- import("kriegsschiffe.xlsx", sheet=1)
str(x)
# Excel data from internet
# https://archive.ics.uci.edu/ml/datasets/energy+efficiency
file <- paste0("https://archive.ics.uci.edu/ml/", 
               "machine-learning-databases/00242/ENB2012_data.xlsx")
x <- import(file)
str(x)
# SPSS data
x <- import("BOSTONH.SAV", to.data.frame=TRUE)
str(x)