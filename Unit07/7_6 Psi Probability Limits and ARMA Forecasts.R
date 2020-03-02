library(tswge)

#(1 - 1.2B + .6B2) Xt = (1 - .5B)at
#psi_0 = 1, psi_1=0.70000,  psi_2=0.24000 -0.13200 -0.30240 -0.28368
psi.weights.wge(phi = c(1.2,-.6),theta = .5,lag.max = 5)

#(1 - .4B + .6B2 - .8B3) Xt = (Xt - 9)at
psi.weights.wge(phi = c(.4,-.6,.8),theta = 9,lag.max = 5)



#AR(1)
data(fig6.1nf)
fore.arma.wge(fig6.1nf,phi = .8,n.ahead = 20,plot = TRUE,limits = FALSE)

fore.arma.wge(fig6.1nf,phi = .8,n.ahead = 20,plot = TRUE,limits = TRUE)

#ARMA(2,1)
data(fig6.2nf)
fore.arma.wge(fig6.2nf,phi = c(1.2,-.6), theta = .5,n.ahead = 20,plot = TRUE,limits = FALSE)

fig6for=fore.arma.wge(fig6.2nf,phi = c(1.2,-.6), theta = .5,n.ahead = 5,lastn = T, plot = TRUE,limits = TRUE)


