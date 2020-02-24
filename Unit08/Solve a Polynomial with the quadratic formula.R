#install.packages("polynom")
library(tswge)
library(polynom)

#Solve a Polynomial with the quadratic formula

#To solve x^2 + 6*x + 13 = 0
#Enter the number backwards
p <- as.polynomial(c(1,-.2,-.48))

#This prints out the formula as a check
print(p, decreasing = TRUE)


pz <- solve(p)
pz


#stopifnot(coef(p) == c(1,0,3)
#polynomial(c(2,rep(0,10),1))

factor.wge(c(-.2,-.48))

fac1=-.2
fac2=-.48
mult.wge(fac1,fac2)
