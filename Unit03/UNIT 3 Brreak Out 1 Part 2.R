#UNIT 3 Time Series
library(tswge)

# Breakout 1

# Part 2
x = read.csv("Unit3BOut1Part2.csv",header = TRUE, stringsAsFactors = FALSE)
#convert the csv to a time series
x<- as.ts(x$x)

#Plot the realization from the csv file
plotts.wge(x)
plotts.sample.wge(x)
#Plot the parzen from the csv file
parzen.wge(x)

#Plot the Low Pass 5 Point Moving Average
a = stats::filter(ts(x),rep(1,5))/5
plot(a,type = "l")
parzen.wge(as.numeric(a[!is.na(a)]))

#Plot the High Pass Differance Filter
#Differencing is a popular and widely used data transform for making time series data stationary.
#Differencing is performed by subtracting the previous
#observation from the current observation.
dif = diff(x,lag = 1)
plot(dif,type = "l")
parzen.wge(dif)

xx = butterworth.wge(x,order = 4,type = "low", cutoff = .1)
par(mfrow = c(1,1))
parzen.wge(xx$x.filt,trunc = 34)

xx = butterworth.wge(x,type = "pass", cutoff = c(.01,.1))
par(mfrow = c(1,1))
parzen.wge(xx$x.filt,trunc = 34)
