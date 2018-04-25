// read current population survey excerpt for 78 and 85
use "Z:\daten\credit.dta", clear

generate problems=(Problems==2)
glm problems i.BankAccount Duration, family(binomial)
