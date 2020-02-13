library(tswge)
#randomly generate signal pluse noise models
gen.sigplusnoise.wge(100,2,4,vara = 100)
gen.sigplusnoise.wge(100,0,0,vara = 10)
gen.sigplusnoise.wge(100,b0 = 0, b1 = 0, phi = .975, vara = 10)#AR(1)

arma=gen.sigplusnoise.wge(100,b0 = 0, b1 = 0, phi = .4, vara = 2)#AR(1)

#Periodic Signal
gen.sigplusnoise.wge(100,coef = c(5,0), freq = c(.1,0),psi = c(.25,0), vara = 10)


#AR(4) From slides
parms = mult.wge(c(.975),c(.2,-.45),c(-.53))
gen.arma.wge(160,phi = parms$model.coef,vara = 1)
