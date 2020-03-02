library(tswge)

#ARIMA(2,1,0)
x = gen.arima.wge(200,phi = c(1.5,-.8), var = 1,d = 1,sn = 31)
plotts.sample.wge(x)

#Use artrans.wge(x,1) for each d we want to take a difference from
FirstDif = artrans.wge(x,1) #Take out the (1-B)
parzen.wge(FirstDif)
aic5.wge(FirstDif) #Check the structure of the noise
