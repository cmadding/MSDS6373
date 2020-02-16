library(tswge)

#(1 - 1.2B + .6B2) Xt = (1 - .5B)at
psi.weights.wge(phi = c(1.2,-.6),theta = .5,lag.max = 5)

#(1 - .4B + .6B2 - .8B3) Xt = (Xt - 9)at
psi.weights.wge(phi = c(.4,-.6,.8),theta = 9,lag.max = 5)



#AR(1)
data(fig6.1nf)
fore.arma.wge(fig6.1nf,phi = .8,n.ahead = 20,plot = TRUE,limits = FALSE)

fore.arma.wge(fig6.1nf,phi = .8,n.ahead = 20,plot = TRUE,limits = TRUE)

#ARMA(2,1)
data(fig6.2nf)
fore.arma.wge(fig6.2nf,phi = c(1.2,-.8), theta = .5,n.ahead = 20,plot = TRUE,limits = FALSE)

fore.arma.wge(fig6.2nf,phi = c(1.2,-.8), theta = .5,n.ahead = 20,plot = TRUE,limits = TRUE)


