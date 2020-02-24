library(tswge)

#ARIMA(2,1,0)

#(1-1.5B + .8B2)(1-B)Xt=at (White Noise Varance of 1 (var=1))
a=gen.arima.wge(n=200, phi=c(1.5,-.8),theta = 0, var = 1, d=1, sn = 31)
acf(a)
plotts.sample.wge(a)

#Factor Table
model = mult.wge(fac1 = c(1.5, -.8), fac2 = 1)
factor.wge(model$model.coef)

#Stationarize the ARIMA(2,1,0): Taking out the (1–B)
x = gen.arima.wge(200,phi = c(1.5,-.8), var = 1,d = 1,sn = 31)
FirstDif = artrans.wge(x,1) #Take out the (1-B)
parzen.wge(FirstDif)
aic5.wge(FirstDif) #Check the structure of the noise


#ARIMA(2,2,1) two (1-B) factors
#(1 - 1.5B + .8B2)(1 - B)2 Xt = (1 + .8B)at
a = gen.arima.wge(200,phi = c(1.5,-.8), theta = -.8, var = 1,d = 2,sn = 21)
acf(a)
p = parzen.wge(a, trunc = 40)
ar = mult.wge(fac1 = c(1.5,-.8), fac2 = 1, fac3 = 1)
factor.wge(ar$model.coef)
#Factor the MA side (Invertable)
factor.wge(-.8)
  
x = gen.arima.wge(200,phi = c(1.5,-.8), var = 1,d = 2,sn = 31)
FirstDif = artrans.wge(x,1) #Take out the (1-B)
SecondDif = artrans.wge(FirstDif,1) # Take out the other (1-B)
parzen.wge(SecondDif)
aic5.wge(SecondDif) #Check the structure of the noise

