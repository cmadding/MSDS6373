#Show that the AIC is better for Box than Parzen or Woodward and Gray.

library(tswge)

data(airlog)
plotts.wge(airlog)

#Looks like an ARMA could be apporate
plotts.sample.wge(airlog)

# take first differences of the data
SA1 = artrans.wge(airlog,1)
plotts.sample.wge(SA1)

# take the 12th difference of the first difference (1-B)(1-B12)
SA1_12 = artrans.wge(SA1,c(rep(0,11),1)) #End up with stationary data

# take the 12th difference of the data (1-B12)
SA12 = artrans.wge(airlog,c(rep(0,11),1))

#Phi(B)(1-B12)(Xt-mu) = at
#modeled with an AR(13) Notice the p=13
Parzen = aic.wge(SA12, p = 13)

#(1-B)(1-B12) (Xt-mu) = Theta(B)at
#modeled with an MA(13) Notice the q=13
Box = aic.wge(SA1_12, q = 13)

# #Phi(B)(1-B)(1-B12) (Xt-mu) = at
# Used an AR(12) p=12
WoodwardAndGray = aic.wge(SA1_12, p = 12)

Parzen$value
Box$value
WoodwardAndGray$value
# We will return to this competition when we use the model to forecast!