library(tswge)

#The following command generates and plots a realization from an AR,
#MA, or ARMA model.
#gen.arma.wge(n,phi,theta,vara,sn)

#positive
gen.arma.wge(n=100,phi=.95)
#negetive
gen.arma.wge(n=100,phi=-.7)
gen.arma.wge(n=100,phi=.95,sn=5)
gen.arma.wge(n=100,phi = -.95,sn=5)


#The following command plots a realization of length n (default = 100),
#the true autocorrelations, and the spectral density for an MA, AR, or
#ARMA model.
#plotts.true.wge(n,phi,theta,lag.max)

# plot realization of length 100, true
# autocorrelations and spectral density
# for an AR(1)
plotts.true.wge(phi=.95)
#Plot the true spectral density
plotts.true.wge(phi = -.5)

# generate (and plot) AR(1) realization and
# place it in vector x
x = gen.arma.wge(n=100,phi = -.5,sn=7)


# plot realization in x along with sample
# autocorrelations, periodogram, and Parzen
# window-based spectral estimator
plotts.sample.wge(x)

#gen.arma.wge - is for stationary modles
#gen.arima.wge - for ARIMA modles like phi_1 = 1 case

gen.arma.wge(n=100,phi=c(.9999))#nearly nonstationary
gen.arma.wge(n=100,phi=c(1)) #error message
gen.arima.wge(n=100,d=1) #ARIMA case (similar to .9999)
gen.arma.wge(n=50,phi=c(1.1)) #error message

#non stationary model with phi_1 = 1.1
#never done in real practice
n=50
x=rep(0,50)
a=rnorm(n)
x[1:50]=0
for(k in 2:n) {
  x[k]=1.1*x[k-1]+a[k]
}
plotts.wge(x)
