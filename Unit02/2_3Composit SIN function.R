#The Actual Signal Is the Sum

library(tswge)

#X(t) = sin(2(.025)t) + 1.5sin(2(.1)t+1) + 2sin(2(.15)t+2.5)
t = seq(1,100,length = 100)
y1 = sin(2*pi*.025*t)#freq of .025
plot(t,y1,type = 'l')
y2 = sin(2*pi*.1*t+1)
plot(t,y2,type = 'l')
y3 = sin(2*pi*.15*t+2.5)
plot(t,y3,type = 'l')
ysum = y1+y2+y3
#A plot with 3 frequencies in it
plot(t,ysum,type = "l")

plotts.sample.wge(ysum, trunc = 70)


#Con Check
#Which of the following functions has a component that has nonzero frequency?
#(Plot them for more information.)
a =  sin(2*pi*.08* t + 5) #This has a nonzero frequency
plot(t,a,type = 'l')
b = .3*t+10 #This has no frequency at all
plot(t,b,type = 'l')
c =  sin(2*pi*.08* t + 5)+.3*t+10 #This has a nonzero frequency
plot(t,c,type = 'l')

plotts.sample.wge(a)
plotts.sample.wge(b)
plotts.sample.wge(c)
