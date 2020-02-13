library(tswge)

#ARIMA(2,2,1)
#(1 - 1.5B + .8B2)(1 - B)2 Xt = (1 + .8B)at

#*You will use this model to answer this and the next two concept check questions.

#Generate a realization of size 500 with seed 35 from this model, and then take the second differences.
x = gen.arima.wge(500,phi = c(.6,-.8), theta = -.3, var = 1,d = 2,sn = 35)

FirstDif = artrans.wge(x,1) #Take out the (1-B)
SecondDif = artrans.wge(FirstDif,1) # Take out the other (1-B)
parzen.wge(SecondDif)

#Use aic5.wge to get the top five correlation structures of the second differenced data.
#What is the most favored by the AIC?
aic5.wge(SecondDif) #Check the structure of the noise
# ARMA(4,2)

#6.4.5
#What do we know the true correlation structure of the second differenced data to be?
#ARMA(2,1)
