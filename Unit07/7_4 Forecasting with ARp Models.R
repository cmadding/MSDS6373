#7.4 Forecasting with AR(p) Models

library(tswge)


data (fig6.1nf)
plotts.wge(fig6.1nf)

#AR(1) Phi Positive
fore.arma.wge(fig6.1nf,phi = .8, n.ahead = 20, plot = TRUE, limits = FALSE)
fig6.1nf[80]
mean(fig6.1nf)
Xa = (1-.8)*mean(fig6.1nf)+.8*(fig6.1nf[80])
Xb = (1-.8)*mean(fig6.1nf)+.8*(Xa)
Xc = (1-.8)*mean(fig6.1nf)+.8*(Xb)

#AR(1) Phi Neg
x1 = gen.arma.wge(100, phi = -.8)
fore.arma.wge(x1,phi = -.8, n.ahead = 20, plot = TRUE, limits = FALSE)

#AR(2)
x2 = gen.arma.wge(n=75, phi = c(1.6,-.8),sn=24)
x2 = x2+25#Give it a mean of 25
plotts.wge(x2)
fore.arma.wge(x2,phi =c(1.6,-.8), n.ahead = 20, plot = TRUE, limits = FALSE)

#AR(2,1)
x3 = gen.arma.wge(n=75, phi = c(1.2,-.6),theta = .5, sn=24)
x3for= fore.arma.wge(x3,phi=c(1.2,-.6), theta = .5, n.ahead=20,limits=FALSE)

#AR(1,1)
fore.arma.wge(x3,phi=c(.8), theta = -.9, n.ahead=20,limits=FALSE)

