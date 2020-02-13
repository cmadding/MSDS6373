#7.4 Forecasting with AR(p) Models

library(tswge)

#AR(1) Phi Positive
data (fig6.1nf)
plotts.wge(fig6.1nf)

fore.arma.wge(fig6.1nf,phi = .8, n.ahead = 20, plot = TRUE, limits = FALSE)
fig6.1nf[80]
Xa = (1-.8)*24.17+.8*(fig6.1nf[80])
Xb = (1-.8)*24.17+.8*(Xa)
Xc = (1-.8)*24.17+.8*(Xb)

#AR(1) Phi Neg
x1 = gen.arma.wge(100, phi = -.8)
fore.arma.wge(x1,phi = -.8, n.ahead = 20, plot = TRUE, limits = FALSE)

#AR(2)
x2 = gen.arma.wge(n=75, phi = c(1.6,-.8),sn=24)
x2 = x2+25
fore.arma.wge(x2,phi =c(1.6,-.8), n.ahead = 20, plot = TRUE, limits = FALSE)

#AR(2,1)
x3 = gen.arma.wge(n=75, phi = c(1.6,-.8),theta = -.9, sn=24)
fore.arma.wge(x3,phi=c(1.6,-.8), theta = -.9, n.ahead=20,limits=FALSE)

#AR(1,1)
fore.arma.wge(x3,phi=c(.8), theta = -.9, n.ahead=20,limits=FALSE)


#ARMA(4,1)
#(1 – 0.967B) (Xt – 2.9) = (1 + .6B)at 
#ARMA(4,1): phi = c(.967), theta = –.477
fs41 = fore.arma.wge(llynx,phi = c(0.7, 0.1, -0.2, -0.3), theta = -.6,n.ahead = 40,limits = FALSE)
