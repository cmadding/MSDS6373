#The Actual Signal Is the Sum

library(tswge)

#X(t) = sin(2(.025)t) + 1.5sin(2(.1)t+1) + 2sin(2(.15)t+2.5)
t = seq(1,100,length = 100)
y1 = sin(2*pi*.025*t)
y2 = sin(2*pi*.1*t+1)
y3 = sin(2*pi*.15*t+2.5)
ysum = y1+y2+y3
plot(t,ysum,type = "l")

plotts.sample.wge(ysum, trunc = 70)
