#Below, we use the tswge commands. 
#gen.aruma.wge (to generate realizations from seasonal models) 
#plotts.sample.wge to plot the realizations, sample autocorrelations, and spectral estimates.

# (1-B^4)Xt = at
x1=gen.aruma.wge(n=80, s=4, sn = 6)
plotts.sample.wge(x1)

#(1-B+.6B^2)(1-B^4)Xt = 1+.5B)at  ARMA(2,1) AR(2)Compoant and MA(1)Component
x2=gen.aruma.wge(n=80, phi=c(1,-.6),s=4,theta=-.5)
plotts.sample.wge(x2)

#Looking at the AR(2) compoant 
factor.wge(phi = c(1,-.6))
#Looking at the MA(1) compoant
factor.wge(phi = -.5)

#Monthly Model
#(1-B+.6B^2)(1-B^12)Xt = (1+.5B)at  ARMA(2,1)
x3=gen.aruma.wge(n=180, phi=c(1,-.6),s=12,theta=-.5)
plotts.sample.wge(x3,lag.max=48)

#Bi Yearley
#(1-.6B+.94B^2)(1-B^6)Xt = (1+.3B)at  ARMA(2,1)
x4=gen.aruma.wge(n=180, phi=c(.6,-.94),s=12,theta=-.3, sn=19)
plotts.sample.wge(x4,lag.max=48)
