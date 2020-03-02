#Canadian Lynx Data
library(tswge)

data(llynx)
plotts.wge(llynx)
plotts.sample.wge(llynx)

#AR(4)
#(1 - 1.3B + 0.7B2 - 0.1B3 + 0.2B4)(Xt - 2.9) = at 
#AR(4): phi = c(1.3, -0.7, 0.1, -0.2)
fs4 = fore.arma.wge(llynx,phi = c(1.3, -0.7, 0.1, -0.2),n.ahead = 40,limits = FALSE)

#ARMA(4,1)
#(1 - 0.7B - 0.1B2 + 0.2B3 + 0.3B4) (Xt - 2.9) = (1 + .6B)at 
#ARMA(4,1): phi = c(0.7, 0.1, -0.2, -0.3), theta = -.6
fs41 = fore.arma.wge(llynx,phi = c(0.7, 0.1, -0.2, -0.3), theta = -.6,n.ahead = 40,limits = FALSE)

#AR(11)
fore.arma.wge(llynx,phi = c(1.1676, -0.5446, 0.2662, -0.3094, 0.1540, -0.1463, 0.0569, -0.0294, 0.1346, 0.2021, -0.3394),n.ahead = 40,limits = FALSE)
