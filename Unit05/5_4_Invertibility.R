#5_4_Invertibility
library(tswge)

#MA(2): X_t = a_t -1.6a_t-1 +.9*a_t-2
factor.wge(phi = c(1.6,-.9))
#Invertibily - outside the unit circle

#MA(2): X_t = a_t -1.6a_t-1 -.9*a_t-2
factor.wge(phi = c(1.6,.9))
#Not Invertibil = inside the unit circle

#MA(2): X_t = a_t +1a_t-1 -.3*a_t-2
factor.wge(phi = c(-.1,.3))
#Invertible - outside the unit circle
#the absolute reciprocal of the roots are .6 and .5.

#Is this the only model that will have this specific absolute
#reciprocal/system frequency (dip in the spectral density) combination?
plotts.true.wge(phi = c(-.1,.3))
#No, but it is the only invertible model that will have this combination.