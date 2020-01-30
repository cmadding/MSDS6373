library(tswge)

#gen.arma.wge(n,phi,theta,vara,sn)

#generate MA(1) data
gen.arma.wge(n=100,theta=-.99)
gen.arma.wge(n=100,theta=.99)
gen.arma.wge(n=100,theta=-.99,sn=5)#set the seed sn=5
gen.arma.wge(n=100,theta=.99,sn=5)
plotts.true.wge(theta = c(-.99))
plotts.true.wge(theta = c(.99))

#Generate MA(2) data from example 2
gen.arma.wge(n=100,theta=c(.9,-.4))
plotts.true.wge(theta = c(.9,-.4))

#5.3.2 con check
gen.arma.wge(theta=-.7)
plotts.true.wge(theta = -.7)

#5.3.3 con check
gen.arma.wge(n=100,theta=c(-.1,.3))
plotts.true.wge(theta = c(-.1,.3))

#AR(2): X_t -1X_t + .9*X_t-2 = a_t
plotts.true.wge(phi=c(1.1,-.9))

#MA(2): X_t = a_t -1.1a_t-1 +.9*a_t-2
plotts.true.wge(theta=c(1.1,-.9))

