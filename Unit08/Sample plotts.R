#Sample Realizations
library(tswge)

gen.arma.wge(250)

data(fig6.1nf)

#AR(1) Positive Phi
AR1P = gen.arma.wge(n=100,phi=0.8)
plotts.sample.wge(AR1P)
#Forcast
fore.arma.wge(fig6.1nf, phi = 0.8, n.ahead = 20, limits = F)

#AR(1) Negetive Phi
AR1N = gen.arma.wge(n=100,phi=-.5)
plotts.sample.wge(AR1N)
#Forcast
fore.arma.wge(fig6.1nf, phi = -0.8, n.ahead = 20, limits = F)

#MA(1) Positive Theta
MA1P <- gen.arma.wge(n = 200, theta = 0.99)
plotts.sample.wge(MA1P)
plotts.true.wge(250, theta = 0.95)

#MA(1) Negetive Theta
MA1N <- gen.arma.wge(n = 200, theta = -0.99)
plotts.sample.wge(MA1N)


#AR(3) Mixed Pos and Neg
plotts.true.wge(250, phi = c(1.95, -1.9, 0.9025))
plotts.true.wge(250, theta = 0.95)
#ARMA(3,1)
plotts.true.wge(250, phi = c(1.95, -1.9, 0.9025), theta = 0.95)




