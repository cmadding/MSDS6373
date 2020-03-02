library(tswge)

# psi-weights for simple MA(1) model (theta) X(t)=(1-.8B)a(t)
psi.weights.wge(theta=.8,lag.max=5)

# psi-weights for simple AR(1) model (phi) (1-.8B)X(t)=a(t)
psi.weights.wge(phi=.8,lag.max=5)  #note that psi(j)=.8j

# psi-weights for ARMA(2,1) model (1-1.2B+.6B2)X(t)=(1-.5B)a(t)
psi.weights.wge(phi=c(1.2,-.6),theta=c(.5),lag.max=5)

#5.7.3 Check
# psi-weights for simple AR(2) model X(t)-1.95X(t-1)+1.9X(t-2)=a_t
psi.weights.wge(phi=c(-.7),lag.max=4)
fore.arma.wge()