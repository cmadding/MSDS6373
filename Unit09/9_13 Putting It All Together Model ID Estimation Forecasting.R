#9.13 Putting It All Together: Model ID, Estimation, Forecasting

library(tswge)
library(readr)

#Read in the data
PutItTogether <- read_csv("putittogether.csv")

#Convert to Time Series
PutItTogether = ts(PutItTogether$x)

#1. Visualize/plot the data.
plotts.wge(PutItTogether) #data read into array PutItTogether
#Sample Partial Autocorrelations
pacf(PutItTogether)
#Sample Autocorrelations
acf(PutItTogether)

#2. Use aic.wge() or aic5.wge() to identify estimates of p and q.
#Default settings
aic5.wge(PutItTogether)
#Changing some settings
aic5.wge(PutItTogether,p=0:8,q=0:2,type="aic")
aic5.wge(PutItTogether,p=0:8,q=0:2,type="bic")

#3. Use the estimate of p and q to get estimates of the phis and thetas.
PutItTogether.Est = est.arma.wge(PutItTogether, p = 2, q = 2)

#4. Use the estimated model to forecast and so on.
fore.arma.wge(PutItTogether, phi = PutItTogether.Est$phi, theta = PutItTogether.Est$theta, n.ahead = 20)

#Note: We are assuming a stationary process and have not investigated the spectral density,
#acfs, and so on to make sure that key properties of the data are preserved.


