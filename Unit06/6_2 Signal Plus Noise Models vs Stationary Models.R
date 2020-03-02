library(tswge)
#randomly generate signal pluse noise models
gen.sigplusnoise.wge(100 ,b0=2 ,b1=4 ,vara = 100)
gen.sigplusnoise.wge(100 ,b0=0 ,b1=0 ,vara = 10) #vara = whitenoise varance
gen.sigplusnoise.wge(100 ,b0=0 ,b1=0 ,phi = .975 ,vara = 10)#AR(1)

arma=gen.sigplusnoise.wge(100,b0 = 0, b1 = 0, phi = .4, vara = 2)#AR(1)

#Periodic Signal
# Xt=5 cos(2PI(.1)t+.25)+Zt where Zt~AR(1)
gen.sigplusnoise.wge(100,coef = c(5,0), freq = c(.1,0),psi = c(.25,0),phi = .975, vara = 10)


#AR(4) From slides
#Factor Form:
#(1-.975B)(1-.2B+.45B2)(1+.53B)Xt=at
parms = mult.wge(c(.975),c(.2,-.45),c(-.53))
#mult.wge will break it down
#(1-.645B+.02225B2-.0969B3-.2325B4)Xt=at
#phi1,phi2,phi3,phi4
#[1]  0.6450000 -0.0222500  0.0969000  0.2325375
gen.arma.wge(160,phi = parms$model.coef,vara = 1)


sigma=sqrt(var(c(10, 12, 8, 9, 6)))
