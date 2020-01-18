#Description
#A regular time-series object containing average air temperatures at Nottingham Castle in degrees F for 20 years.

#Source
#Anderson, O.D. (1976) Time Series Analysis and Forecasting: The Box-Jenkins approach. Butterworths. Series R.

#Usage
#nottem
#install.packages("tseries")

require(stats)
require(graphics)
library(xtable)
library(tseries)


#Average Monthly Temperatures at Nottingham, 1920-1939
data(nottem)
ts(nottem, start=c(1920, 1), end=c(1939, 12), frequency=12)
start(nottem)
end(nottem)
length(nottem)
dim(nottem)
names(nottem)
summary(nottem)

plot(nottem,type = "b",main = "Average Monthly Temperatures at Nottingham, 1920-1939", ylab="Air Temperature (Degrees Fahrenheit)", xlab="Month/Year")
abline(reg=lm(nottem~time(nottem)))

nott <- window(nottem, end = c(1936,12))

fit <- arima(nott, order = c(1,0,0), list(order = c(2,1,0), period = 12))

nott.fore <- predict(fit, n.ahead = 36)

ts.plot(nott, nott.fore$pred, nott.fore$pred+2*nott.fore$se,
        nott.fore$pred-2*nott.fore$se, gpars = list(col = c(1,1,4,4)))

# Beginning Time Series Analysis
nottemtimeseries = ts(nottem, frequency=12, start=c(1920,1),end=c(1939, 12))
nt = xtable(nottemtimeseries)
nt

#Plot of Timeserires
plot(nottemtimeseries, col = "blue",lwd=2,lty=1, main="TIME SERIES PLOT OF NOTTEM",cex.main=1)
plot.ts(nottem, col = "blue",lwd=2,lty=1, main="TIME SERIES PLOT OF NOTTEM",cex.main=1)

#ACF
acf(nottem[1:240], main="ACF of Nottingham")
acf(nottem[1:120],plot=TRUE, main="ACF of Nottingham 1st Half")
acf(nottem[120:240],plot=TRUE, main="ACF of Nottingham 2nd Half")

acf(nottem, lag.max=12) # plot a correlogram

## Transform the lags from years to months
nottempl = acf(nottem,lag.max=12, plot=FALSE)
nottempl$lag <- nottempl$lag * 12
## Plot the acf with months 
plot(nottempl, main="ACF of Nottingham", xlab="Lag (months)")

#PACF
pacf(nottem, main="PACF of Nottingham")
pacf(nottemtimeseries, lag.max=20) # plot a correlogram
pacf(nottemtimeseries, lag.max=20, plot=FALSE)

#Augmented Dickey-Fuller (ADF) t-statistic test for unit root
#Another test we can conduct is the Augmented Dickey-Fuller (ADF)
#t-statistic test to find if the series has a unit root
#(a series with a trend line will have a unit root and result in a large p-value).

adf.test(nottem)

#Kwiatkowski-Phillips-Schmidt-Shin (KPSS) for level or trend stationarity
#We can test if the time series is level or trend stationary using the Kwiatkowski-Phillips-Schmidt-Shin (KPSS) test.
#Here we will test the null hypothesis of trend stationarity
#(a low p-value will indicate a signal that is not trend stationary, has a unit root):

kpss.test(nottem, null="Trend")


