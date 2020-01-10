#Read in the data
xdf = c(76,70,66,60,70,72,76,80)

#Assuming this data comes from a stationary process, we can estimate the mean with the sample mean of all the data in the sample

#Mean (X Bar)
Xbar = mean(xdf)

#Estimating the Variance of a Stationary Series
x = as.numeric(paste(xdf))
x = x[!is.na(x)]
n=length(x) #n = 8
nlag=7 #n-1

v=var(x,na.rm = TRUE)

#lambda hat 0
gamma0=var(x)*(n-1)/n

#RHO Hat information
aut=acf(x,lag.max=7) #n-1
RhoH0 = aut$acf[1]
RhoH1 = aut$acf[2]

#lambda hat 1
gamma1= gamma0*RhoH1

#variance of x bar hat (standard dev * 2)
sum=0
for (k in 1:nlag) {sum=sum+(1-k/n)*aut$acf[k+1]*gamma0}
vxbar=2*sum/n+gamma0/n #note the mult of sum by 2
vxbar

#95% Confidence Intervals
MOE = 1.96*sqrt(vxbar)
LL = mean(xdf) - MOE
UL = mean(xdf) + MOE
#We are 95% confidence that the mean is contained in the interval
LL
UL

plot.ts(xdf, col = "blue",lwd=2,lty=1, main="TIME SERIES PLOT OF data",cex.main=1)

acf(xdf)
acf(xdf[1:4])
acf(xdf[4:7])

#install.packages(tseries)
library(tseries)
#Augmented Dickey-Fuller Test
adf.test(xdf)
