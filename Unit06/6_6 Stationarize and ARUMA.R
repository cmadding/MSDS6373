#Stationarize Quarterly Data:
#Taking out the (1 - B4)

library(tswge)

#tswge function to generate ARIMA and Seasonal Models
x4=gen.aruma.wge(n=80, s=4, sn = 81)
#Take out the (1-B^4)
Dif4 = artrans.wge(x4,c(0,0,0,1))
#Check the structure of the noise
aic5.wge(Dif4)
#create a factor table (You can use c(rep(0,3),1)) to repeat the zeros.
factor.wge(phi = c(0,0,0,1))

# Stationarize Monthly Seasonal Data:
# Taking out the (1 - B12)

#AR(3) and MA(1) components
# (1 - .4B - .6B2 + .74B3)(1 - B12) Xt = (1 + .7B)at
x12=gen.aruma.wge(n=80, phi = c(.4,.6,-.74), theta = c(-.7), s=12, sn = 31)
#Take out the (1-B^12) rep=repeate 11 zeros and put a one at the end
Dif12 = artrans.wge(x12,c(rep(0,11),1))
#Check the structure of the noise
aic5.wge(Dif12)

gen.aruma.wge(n=200,phi=.7,d=1,s=12,lambda=c(1.6,-1),theta=-.8)


#(1 - .6B + .8B^2)(1 - B^12) Xt = (1-.3 + .7B^2)at
x12_500=gen.aruma.wge(n=500, phi = c(.6,-.8), theta = c(.3, -.7), s=12, sn = 37)
#Take out the (1-B^12) rep=repeate 11 zeros and put a one at the end
FirstDif12 = artrans.wge(x12_500,c(rep(0,11),1))
# Take out the other (1-B) use rep again
SecondDif12 = artrans.wge(FirstDif12,c(rep(0,11),1)) 
#Check the structure of the noise
aic5.wge(SecondDif12)
#The best is an ARMA(2,2)

#create a factor table
factor.wge(phi=c(rep(0,11),1))

#Sample factor tables
factor.wge(c(0,0,0,1))
factor.wge(c(0,0,0,0,0,0,0,0,0,0,0,1))
factor.wge(c(rep(0,3),1))
factor.wge(c(rep(0,11),1))
factor.wge(c(rep(0,4),1))

