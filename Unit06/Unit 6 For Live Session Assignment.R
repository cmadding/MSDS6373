#For Live Unit 6
library(tswge)

# 1. Looking at your time series from the first day of class, you addressed its stationarity before.
# Does either a signal plus noise, ARIMA, or ARUMA (seasonal) model seem appropriate?
data(nottem)
plotts.sample.wge(nottem)

# 2. Copy and paste the factor table for a seasonal model with s = 7.
#Create a factor table for a seasonal model (1-B^7)
factor.wge(c(rep(0,6),1))

# 3. Comment and provide evidence if the following models looks to be:
# a. (1-B4) Xt = (1+.3B) (1-.6B+.8B2)at
x=gen.aruma.wge(n=80, phi = c(.6,-.8), theta = c(-.3), d = 0, s=4, sn = 31)
Dif = artrans.wge(x,c(rep(0,3),1)) #Take out the (1-B^4)
aic5.wge(Dif) #Check the structure of the noise


# b. (1+.3B) Xt = (1-.6B+.8B2) at
plotts.true.wge(phi = c(-.3), theta = c(.6, -.8))
#AR
factor.wge(c(-.3))
#MA
factor.wge(c(.6,-.8))
#ARMA(1,2)

# c. (1-.1B-.99B2 +.013B3 +.2078B4 +.0888B5 +.00864B6)(1-B)2(1-B12) Xt = (1-.6B+.8B^2)at
#AR
factor.wge(c(0.10, 0.99, -0.01, -0.2078, -0.888, -0.00864, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00))
#MA
factor.wge(c(0.60,-0.80))
# (1-B)^2 (1-0.6B+0.8B^2) (1-1.9584B+1.1578B^2) (1+0.7033B+0.6681B^2) (1+0.0098B)Xt = (1-0.6B+0.8B^2)at
# ARUMA(2,12,2)

#ARUMA with d not= 0 and s not= 0
aruma1 = gen.aruma.wge(n=200,d=1,s=4,plot=TRUE,sn=31)
plotts.sample.wge(aruma1)

#ARUMA with d = 0 and s not= 0 (Identify p and q as well.)
aruma2 = gen.aruma.wge(200,phi=0.5,theta=0.5,d=0,s=1,plot=TRUE,sn=31)
plotts.sample.wge(aruma2)

#ARIMA (Identify d as well as p and q.)
arima1 = gen.arima.wge(n=200, phi=c(.5,-.3), theta=c(-.4,.6,-.51), d=1, plot = TRUE,sn=31)
plotts.sample.wge(arima1)

#ARMA (Identify p and q.)
arma1 = gen.arma.wge(n=200, phi=c(.5,-.3), theta=c(-.4,.6,-.51), plot = TRUE,sn=31)
plotts.sample.wge(arma1)


# 4.	Pick a stock and download the last years worth of daily stock price data.  
#Read in one year od Chesapeake Energy's stock data
library(readr)
CHK = read_csv("Unit06/CHK.csv")
head(CHK)
# Plot the data. 
plot.ts(CHK$`Adj Close`)
# Take the first difference, and then estimate the structure of differenced data.
CHKarTrans = artrans.wge(CHK$`Adj Close`,phi.tr = 1)
acf(CHKarTrans)
# From this information, suggest a model for the data.
aic5.wge(CHKarTrans)
