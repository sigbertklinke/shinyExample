*Function and Expressions*
help fweight // weighted Variables - 3 types
set obs 1 // one observation for each variable
gen y=2
gen x=1
gen u=.

replace u=x+y
gen z=float(-(x+y^(x-y))/(x*y))
display z
gen z_new=. // convert numeric to string
tostring z z_new, replace
describe z_new
describe z // now z is a string
gen x_new=. // convert numeric to string
tostring x x_new, replace
describe x_new
describe x // now x is a string



