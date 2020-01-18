library(tswge)
library(stats)

#Pull in the data
data("fig1.21a")

#See what the original data looks like
plot(fig1.21a,type = 'l')

#Setup a 5 Point Moving Average Filter
ma = stats::filter(fig1.21a,rep(1,5))/5

#Plot the Low Pass 5 Point Moving Average
plot(ma,type = 'l')

#Setup a Differance Filter
dif = diff(fig1.21a,lag = 1)

#Plot the High Pass Differance Filter
plot(dif,type = 'l')


Realization = gen.sigplusnoise.wge(200,coef = c(5,0),freq = c(.1,0),vara = 10,sn=1)

#Setup a 5 Point Moving Average Filter
maR = stats::filter(Realization,rep(1,5))/5

#Plot the Low Pass 5 Point Moving Average
plot(maR,type = 'l')
