#7_8 Forecasting with ARIMA

#ARIMA(0,1,0)
#(1-B)Xt=at
#wandering positive phi peek at 0
#d = Order of difference
ARIMA010=gen.aruma.wge(n=50,phi=.8,d=1,sn=15)
fore.aruma.wge(ARIMA010,d=1,n.ahead=20,limits=F)
plotts.sample.wge(ARIMA010)

#ARIMA(1,1,0)
#(1 - .8B)(1 - B) Xt = at
ARIMA110=gen.aruma.wge(n=50,phi=.8,d=1,sn=15)
#Levels out
fore.aruma.wge(ARIMA010,phi=.8,d=1,n.ahead=20 , limits = FALSE)

#ARIMA(0,2,0)
#(1 - B)^2 Xt = at
ARIMA020=gen.aruma.wge(n=50,phi=.8,d=1,sn=15)
#looks at the last 2 and forcast into the future
fore.aruma.wge(ARIMA020,d=2,n.ahead=20, limits = F)
