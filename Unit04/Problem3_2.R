#Problem 3.2

#A
#Generate and plot a realization of length n = 200 from the MA(1) process
library(tswge)

# Xt -.95x_t-1 = a_t
x=plotts.true.wge(n=200,phi=.95)

#The data shows non-cyclic, wandering behavior around which can be explained by the fact that
#the autocorrelations for the lower lags are high-positive.
#That is, if an observation is above the mean, then the next few will likely also be above the mean, ect.
#The spectrral density shows a spike at f=0 which further explains the non-cyclic behavior.

#The process Varance 1/(1-.95)sqr
varance = x$acv[1]

mean(x$data)

var(x$data)


#B
# (X_t-10) - 1.5(X_t-1-10) + .9(X_t-2-10) = a_t
x=plotts.true.wge(n=200, phi=c(1.5,-.9))

#Since the model has mean 10
x10=x$data+10
plotts.wge(x10)
#The other 2 plots do not change with the mean 10.

#Varance
x$acv[1]

#The autocorrelations P1 and P2
x$aut1[2]
x$aut1[3]

mean(x10)

#This varance is quite a bit smaller than the actual varance in this case
var(x10)
