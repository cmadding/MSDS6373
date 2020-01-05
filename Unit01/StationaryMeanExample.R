#Screencast for Stationary Mean

#install.packages("tswge")

library(tswge)

a1 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(3,0),vara = 3, plot = FALSE)
b1 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(3,0),vara = 3, plot = FALSE)
c1 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(3,0),vara = 3, plot = FALSE)
d1 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(3,0),vara = 3, plot = FALSE)
e1 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(3,0),vara = 3, plot = FALSE)
plot(a1,type = "l")
lines(b1,col = "blue", type = "l")
lines(c1,col = "red", type = "l")
lines(d1,col = "green", type = "l")
lines(e1,col = "purple", type = "l")


a2 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(runif(1,0,2*pi),0),vara = 3, plot = FALSE)
b2 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(runif(1,0,2*pi),0),vara = 3, plot = FALSE)
c2= gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(runif(1,0,2*pi),0),vara = 3, plot = FALSE)
d2 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(runif(1,0,2*pi),0),vara = 3, plot = FALSE)
e2 = gen.sigplusnoise.wge(100,coef=c(5,0),freq = c(.1,0), psi = c(runif(1,0,2*pi),0),vara = 3, plot = FALSE)
plot(a2,type = "l")
lines(b2,col = "blue", type = "l")
lines(c2,col = "red", type = "l")
lines(d2,col = "green", type = "l")
lines(e2,col = "purple", type = "l")


par(mfrow = c(2,1))
plot(a1,type = "l")
lines(b1,col = "blue", type = "l")
lines(c1,col = "red", type = "l")
lines(d1,col = "green", type = "l")
lines(e1,col = "purple", type = "l")
plot(a2,type = "l")
lines(b2,col = "blue", type = "l")
lines(c2,col = "red", type = "l")
lines(d2,col = "green", type = "l")
lines(e2,col = "purple", type = "l")