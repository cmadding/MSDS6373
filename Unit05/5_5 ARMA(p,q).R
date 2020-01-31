library(tswge)

#ARMA(p,q)

#Cancallation Example 5.4.4
plotts.true.wge(250, phi = c(1.3,-.4), theta = c(.8))
#After factoring and cancling out we are left with:
plotts.true.wge(250,phi = c(.5))

#AR factors
plotts.true.wge(phi = c(.3,.9,.1,-.8075))
factor.wge(c(.3,.9,.1,-.8075))

#MA factor
plotts.true.wge(theta = c(-.9,-.8,-.72))
factor.wge(c(-.9,-.8,-.72))

#ARMA
plotts.true.wge(phi = c(.3,.9,.1,-.8075), theta = c(-.9, -.8,-.72))

#5.5.10
plotts.true.wge(phi = c(.1,-.5,.7), theta = c(.7, -.8))
#It has a strong frequency at .3021 and a fairly prominent dip in the spectral density at .1841.
#There is some evidence of wandering behavior with a small increase in the spectral density at 0.