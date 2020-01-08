#Read in the data
xdf = c(4,6,7,5,3)

#Assuming this data comes from a stationary process, we can estimate the mean bond rate with the sample mean of all the bond rates in the sample
mean(xdf)

#Estimating the Variance of a Stationary Series
x = as.numeric(paste(xdf))
x = x[!is.na(x)]
n=length(x) #n = 5
nlag=4 #n-1
m=mean(x)
v=var(x,na.rm = TRUE)
gamma0=var(x)*(n-1)/n
aut=acf(x,lag.max=5) #n-1
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

install.packages(tseries)
library(tseries)
#Augmented Dickey-Fuller Test
adf.test(xdf)

acf(xdf)
acf(xdf[1:3])
acf(xdf[3:5])
