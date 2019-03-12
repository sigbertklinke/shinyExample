library("rio")
x  <- import("https://shinyapps.wiwi.hu-berlin.de/d/CPS78-85.tsv")
xs  <- subset(x, year==85)
# Add exper^2 ?
lms <- lm (lwage~educ+exper, data=xs)
add1(lms, ~.+I(exper^2), test="F")
# Drop one variable
lms <- lm (lwage~educ+south+nonwhite+female+
					 	married+exper+union, data=xs)
drop1(lms, test="F")