*Function and Expressions*

clear all
set more off
capture log close
cd "H:\Arbeit Statistik\Umsetzung\data"

// weighted Variables - 3 types 
help fweight 
help aweight
help pweight

/*
Arithmetic Operators
*/

set obs 1 // one observation for each variable
// ceteris paribus y bleibt konstant
gen y=2
gen x=1
gen u=.

replace u=x+y
gen z=float(-(x+y^(x-y))/(x*y))
display u
display z

/*
String Operators
*/

gen z_new=. // convert numeric to string
tostring z z_new, replace
describe z_new
describe z // now z is a string

gen x_new=. // convert numeric to string
tostring x x_new, replace
describe x_new
describe x // now x is a string

gen s=x+z 
display s

/*
destring - Convert string variables to numeric variables and vice versa
encode -  Encode string into numeric and vice versa
*/

/* String - Label values
use http://www.stata-press.com/data/r13/gxmpl9, clear
list
*/

