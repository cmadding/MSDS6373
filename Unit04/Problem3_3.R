#Problem 3.3
library(tswge)

#a
factor.wge(phi = c(1.55, -1, .25))
#All the roots are outside the unit circle so this autoregressive process is stationary.

#b
factor.wge(phi = c(2, -1.76, 1.6, -.77))
#We see that since the characteristic equation has a root inside the unit circle (0.8349) this autoregressive process is nonstationary.

#d
factor.wge(phi = c(1.9, -2.3, 2, -1.2, .4))
#All the roots are outside the unit circle so this autoregressive process is stationary.

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(1.9, -2.3, 2, -1.2, .4))

#What is the differance between c and a, b, and d?
#C is a function of the white noise rather than lagged observations of X