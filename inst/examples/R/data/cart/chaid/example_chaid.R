# install.packages("CHAID", 
#   repos="http://R-Forge.R-project.org")
# requires "partykit"
# create unweighted data table
wtab  <- as.data.frame(Titanic)
index <-  rep(1:nrow(wtab), wtab$Freq)
utab  <- wtab[index,]
# 
library("CHAID")
chaid(Survived~Class+Sex+Age, data=utab)