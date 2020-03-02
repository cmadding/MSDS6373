library(tswge)
#Read in the data
#xdf = c(6,8,13,12,10,7,4,2)
xdf = c(5,9,13,15,14,10,12,17,20,25)

#Assuming this data comes from a stationary process,
#we can estimate the mean with the sample mean of all the data in the sample

#estimate the Mean (X Bar)
Xbar = mean(xdf)

sigma=sqrt(var(xdf))

#(Rho=P) Autocorrelations of series by lag
Rhos=acf(xdf, type = "correlation", plot = F)
Rhos0=Rhos$acf[1]
Rhos1=Rhos$acf[2]
Rhos7=Rhos$acf[8]

#(Gamma=Y) Autocovariances of series by lag
Gammas=acf(xdf, type = "covariance", plot = F)
Gammas0=Gammas$acf[1]
Gammas1=Gammas$acf[2]
Gammas6=Gammas$acf[7]
Gammas7=Gammas$acf[8]

#Estimating the Variance of a Stationary Series
x = as.numeric(paste(xdf))
x = x[!is.na(x)]
n=length(x) #n = 8
nlag=n-1 #n-1=7

v=var(x,na.rm = TRUE)

#gamma hat 0
gamma0=var(x)*(n-1)/n

#RHO Hat information
aut=acf(x,lag.max=nlag) #n-1
RhoH0 = aut$acf[1]
RhoH1 = aut$acf[2]

#gamma hat 1
gamma1= gamma0*RhoH1

#variance of x bar hat (standard dev * 2)
sum=0
for (k in 1:nlag) {sum=sum+(1-k/n)*aut$acf[k+1]*gamma0}
vxbar=2*sum/n+gamma0/n #note the mult of sum by 2
vxbar


plotts.sample.wge(x)

#f. Given the model: (1-.5B)X_t=a_t
#Calculate (by hand and show the steps) X_8+1=X_9
X9=.5*(2)+(1-.5)*(7.75)
#Check it:
fore.arma.wge(xdf,phi = .5,n.ahead = 2)


#95% Confidence Intervals
MOE = 1.96*sqrt(vxbar)
LL = mean(xdf) - MOE
UL = mean(xdf) + MOE
#We are 95% confidence that the mean is contained in the interval
LL
UL

plot.ts(xdf, col = "blue",lwd=2,lty=1, main="TIME SERIES PLOT OF data",cex.main=1)

acf(xdf)
acf(xdf[1:5])
acf(xdf[5:10])




  