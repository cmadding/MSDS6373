#7.10 Signal Plus Noise Forecasts


#half width example
(1.96*1.87)*sqrt(1^2 + (0.4)^2 + (-0.44)^2)


library(tswge)

#intersept b0=10
x=gen.sigplusnoise.wge(n=50,b0=10,b1=.2, phi=c(.8,-.6))
#
xfore=fore.sigplusnoise.wge(x,linear=TRUE,n.ahead=20,lastn=F,limits=F)
#Notice that the realization has a line with cyclic noise.
#The forecasts for early lags forecast the cyclic behavior,
#while for longer steps ahead, they trend to the underlying line.


#7.10.2 Check
#Using the adjusted close from the Amazon stock data
AMZN = read.csv("AMZN.csv",header = TRUE)
#Convert to a Time Series
AMZNforcast = ts(AMZN$Adj.Close)
plotts.wge(AMZNforcast)
plotts.sample.wge(AMZNforcast)

#fit a signal plus noise model to the data
AMZNfore=fore.sigplusnoise.wge(AMZNforcast,linear=TRUE,n.ahead=30,lastn=F,limits=F)

#What is the forecast for the 30th day (the last forecast)?
#Round the response to the nearest hundredth (penny).
AMZNfore$f[30]
#1927.66

#What is the lower 95 percent limit of this forecast?
#Please round to the nearest penny.
AMZNfore$ll[30]
#1703.74
min(AMZNfore$ll)
#1582.54


#What is the upper 95 percent limit of this forecast?
#Please round to the nearest penny.
AMZNfore$ul[30]
#2151.58
max(AMZNfore$ul)
#2151.58

