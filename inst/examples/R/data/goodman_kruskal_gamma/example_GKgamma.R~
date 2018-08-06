library("vcdExtra") # for Accident & GKgamma
library("devtools") # for source_...
Accident$mode <- ordered(Accident$mode, levels=levels(Accident$mode)[c(4,2,3,1)])
tab <- xtabs(Freq~mode+age, data=Accident)
tab
GKgamma(tab)
#source_url("http://gist.githubusercontent.com/marcschwartz/3665743/raw/02d15d01846091676b33cbc4db881b5247232a6d/Measures.R")
source_gist("3665743", 
            sha1="9c4f2ccf91a88be5734b0a616156500add8acdb2")
calc.gamma(tab)