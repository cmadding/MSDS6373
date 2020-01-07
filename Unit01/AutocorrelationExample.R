#Autocorrelation of Time Series with Dependent Observations (Lag = 1)

Y5 = c(5.1,5.2,5.5,5.3,5.1,4.8,4.5,4.4,4.6,4.6,4.8,5.2,5.4,5.6,5.4,5.3,5.1,5.1,4.8,4.7,4.5,4.3,4.6,4.8,4.9,5.2,5.4,5.6,5.5,5.5)

Time = seq(1,5,length = 30)

plot(Time,Y5, main = "Regression of Y5 on Time",ylim = c(4,6.2), cex.axis = 1.5)

#Autocorrelation at lag 1
acf(Y5,plot = FALSE, lag.max = 1)

#Autocorrelation upto lag 20 with/without the plot
acf(Y5,plot = TRUE, lag.max = 20)
acf(Y5,plot = FALSE, lag.max = 20)


#Autocorrelation of Time Series with Independent Observations with tswge (Lag = 1)
#install.packages("tswge")
library(tswge)

Realization1 = gen.arma.wge(n = 250)

Time = seq(1, 250, length.out = 250)

plot(Time, Realization1)
#Autocorrelation at lag 1
acf(Realization1,plot = FALSE,lag.max = 1)

#Autocorrelation of Time Series with Independent Observations with tswge (Lag = 1 to k)
acf(Realization1,plot = FALSE,lag.max = 20)
acf(Realization1,plot = TRUE,lag.max = 20)
