# Do not run
# install from an official CRAN server
install.packages("foreign")
# install from unofficial HU CRAN server
install.packages("foreign", repos="http://cran.wiwi.hu-berlin.de")
# install from GitHub
install.packages("devtools")
library("devtools")
install_github("simecek/additivityTests")
