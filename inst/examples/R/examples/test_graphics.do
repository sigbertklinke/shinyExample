set obs 20
generate x = runiform()
generate y = runiform()
list x y 
graph twoway scatter y x
