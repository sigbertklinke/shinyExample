x   <- read.csv2("cps78_85.csv")
xs  <- subset(x, year==85)
# Add exper^2 ?
lms <- lm (lwage~educ+exper, data=xs)
add1(lms, ~.+I(exper^2), test="F")
# Drop one variable
lms <- lm (lwage~educ+south+nonwhite+female+
					 	married+exper+union, data=xs)
drop1(lms, test="F")