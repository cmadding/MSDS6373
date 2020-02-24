#Read in the data
xdf = c(76,70,66,60,70,72,76,80)
#xdf = c(5, 8, 9, 8, 7, 6, 4, 3)

#Assuming this data comes from a stationary process, we can estimate the mean with the sample mean of all the data in the sample

#Mean (X Bar)
sum(xdf)/length(xdf)
#Using the mean statement
Xbar = mean(xdf)

#Estimating the Variance of a Stationary Series
x = as.numeric(paste(xdf))
x = x[!is.na(x)]
n=length(x) #n = 8
nlag=n-1 #n-1

v=var(x,na.rm = TRUE)

#lambda hat 0
gamma0=var(x)*(n-1)/n

#RHO Hat information
aut=acf(x,lag.max=7) #n-1
RhoH0 = aut$acf[1] #rho 0 will always be 1 because it is completely correlated with itself
RhoH1acf = aut$acf[2]

#gamma hat 1
gamma1= gamma0*RhoH1acf

#rho hat 1 is gamma1 devided by gamma0 which is 1
RhoH1 = gamma1/gamma0

#variance of x bar hat (standard dev * 2)
sum=0
for (k in 1:nlag) {sum=sum+(1-k/n)*aut$acf[k+1]*gamma0}
vxbar=2*sum/n+gamma0/n #note the mult of sum by 2
vxbar

#95% Confidence Intervals
MOE = 1.96*sqrt(vxbar)
LL = Xbar - MOE
UL = Xbar + MOE
#We are 95% confidence that the mean is contained in the interval
LL
UL

plot.ts(xdf, col = "blue",lwd=2,lty=1, main="TIME SERIES PLOT OF data",cex.main=1)

plotts.sample.wge(x)

acf(xdf)
acf(xdf[1:4])
acf(xdf[4:7])

#install.packages(tseries)
library(tseries)
#Augmented Dickey-Fuller Test
adf.test(xdf)