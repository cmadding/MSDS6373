library(tswge)

#ARIMA(0,1,0)
#(1-B)X1=at
x1=gen.arima.wge(n=200,phi = 0, var = 1,d=1, sn=31)
plotts.sample.wge(x1)
acf(x1)

#(1-B)(1-1.5B+.8B2)Xt=at
x2=gen.arima.wge(n=200, phi=c(1.5,-.8),d=1)
plotts.sample.wge(x2)

#(1-B)^2(1-1.5B+.8B^2)Xt=(1+.8B)at
x3=gen.arima.wge(n=200, phi=c(1.5,-.8),d=2,theta=-.8)
plotts.sample.wge(x3)
