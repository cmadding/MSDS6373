library(tswge)

#Question 4.6.4
# X_t -.2X_t-1 -.4X_t-2 = a_t
#Factor Table
factor.wge(phi = c(.2, .4))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(.2, .4))

# X_t + .5X_t-1 + .6X_t-2 = a_t
#Factor Table
factor.wge(phi = c(-.5, -.6))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(-.5, -.6))

# X_t - 1.95X_t-1 + 1.8X_t-2 - .855X_t-3 = a_t
#Factor Table
factor.wge(phi = c(1.95, -1.85, .855))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(1.95, -1.85, .855))


# X_t - 1.59X_t-1 + .544X_t-2 + .511X_t-3 - .222X_t-4 = a_t
#Factor Table
factor.wge(phi = c(1.59, -.544, -.511, .222))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(1.59, -.544, -.511, .222))


# X_t - .2X_t-1 - 1.23X_t-2 + .26X_t-3 + .66X_t-4 = a_t
#Factor Table
factor.wge(phi = c(.2, 1.23, -.26, -.66))
plotts.true.wge(phi=c(.2, 1.23, -.26, -.66))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(.2, 1.23, -.26, -.66))

plotts.true.wge(phi = c(-.59, -.544, -.511, -.222))

plotts.true.wge(phi = c(0.1516, 0.0769, 0.0016, -0.0095, 0.0542, 0.1117, 0.5683))
factor.wge(phi = c(0.1516, 0.0769, 0.0016, -0.0095, 0.0542, 0.1117, 0.5683))

plotts.true.wge(phi = c(0.1516, 0.0769, 0.0016, -0.0095, 0.0542, 0.1117, 0.5683))
plotts.true.wge(phi = c(0.4295, 0.1769, 0.0358, 0.1454))
plotts.true.wge(phi = c(0.1529, 0.0988, 0.0059, -0.0075, 0.0538, 0.1118, 0.5717, 0.0034, -0.0382 ))
plotts.true.wge(phi = c(-.9))
plotts.true.wge(phi = c(0.15, -0.4))

#AR(2)
factor.wge(phi = c(-.5, -.6))
ar2=plotts.true.wge(phi=c(-.5, -.6))

#AR(3)
factor.wge(phi = c(1.95, -1.85,.855))
ar3=plotts.true.wge(phi=c(1.95, -1.85,.855))

#AR(4)
factor.wge(phi = c(1.6, -.23,-1,.576))
plotts.true.wge(phi=c(1.6, -.23,-1,.576))
