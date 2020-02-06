#Exampples from:
#http://www.utstat.utoronto.ca/hadas/STA457/Lecture%20notes/R_armasimulation.pdf

library(stats)

#Simulate 100 observations from an ARMA(2,2) Process
arma.sim<-arima.sim(model=list(ar=c(.9,-.2),ma=c(-.7,.1)),n=100)
arma.sim

#Make a time series plot of the data
ts.plot(arma.sim)

#Calculate the Sample Autocorrelation Function
arma.acf<-acf(arma.sim,type="correlation",plot=T)
arma.acf

#Calculate the Sample Partial Autocorrelation Function
arma.pacf<-acf(arma.sim,type="partial",plot=T)
arma.pacf
