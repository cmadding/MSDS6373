#The Actual Signal Is the Sum
t = seq(1,100,length = 100)

#Frequency of .025
y1 = sin(2*pi*.025*t)
plot(t,y1,type = "l")

#Frequency of .1
y2 = sin(2*pi*.1*t+1)
plot(t,y2,type = "l")

#Frequency of .15
y3 = sin(2*pi*.15*t+2.5)
plot(t,y3,type = "l")

#Frequency of .08
y4 = sin(2*pi*.08*t+2.5)
plot(t,y3,type = "l")

#Frequency of .15
y5 = sin(2*pi*.15*t+2.5)
plot(t,y3,type = "l")

#Frequency of .15
y6 = sin(2*pi*.15*t+2.5)
plot(t,y3,type = "l")

#This has 3 Frequency in it
ysum = y1+y2+y3
plot(t,ysum,type = "l")
plotts.sample.wge(ysum)
parzen.wge(ysum, trunc=70)
parzen.wge(llynx)
