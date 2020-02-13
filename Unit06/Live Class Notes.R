#Generste and AR(3)
phis = mult.wge(fac1 = .3, fac2 = -.9, fac3 = -.7)
phis
x=gen.arma.wge(1000,phi = c(-1.3,-.15,.189),sn=9)
plotts.sample.wge(x)
aic5.wge(x)
