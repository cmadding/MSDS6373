#Unit 7: For Live Session
library(tswge)
#1. Which model do you think is appropriate to use to forecast your time series? Why?
#R Data
data(nottem)
plotts.sample.wge(nottem)
fore.aruma.wge(nottem,s=12,n.ahead=12,lastn=F,plot=T,limits=FALSE)

#2. Find the first 5 psi weights for the model below, and use them to find the
#half-width of the 95 percentile probability interval for the third forecast (Xhat(3)).
#Please show your work as well as a plot of the series and the first eight forecasts with probability intervals.
#(1-.9B)(1-.8B)Xt = at
#X1 = 5 X2 = 8 X3 = 9 X4 = 8 X5 = 7 X6 = 6 X7 = 4 X8 = 3
x = c(5, 8, 9, 8, 7, 6, 4, 3)
#So the real formula is:
#(1-1.7B+0.72B^2)X_t = a_t
mult.wge(fac1 = -.9, fac2 = -.8)
#phi = c(1.7, -.72) needed mupliti the B's
live2=fore.arma.wge(x,phi = c(1.7, -.72), theta = 0,n.ahead = 8,limits=T, lastn = F)

#Find the first 5 psi weights
psi5=live2$psi[1:5]
#First 5 psi weights: 1.70000 2.17000 2.46500 2.62810 2.69297

#Provide white noise variance.
wnv=live2$wnv
#White Noise Variance = 0.9958917
#Break down of WNV a sum of the resid squared dev by the total resid
wnv2=sum((live2$resid)^2)/6
#White Noise Standard Dev = 0.9979437
wnSD=sqrt(live2$wnv)

#half width example
(1.96*1.87)*sqrt(1^2 + (0.4)^2 + (-0.44)^2)

#half width third forecast (Xhat(3))
(1.96*live2$wnv)*sqrt(1 + (live2$psi[1])^2 + (live2$psi[2])^2)
#The half width if the third forecast (Xhat(3)) = 5.723868
half_width1 = live2$ul[3] - live2$f[3]
half_width2 = live2$f[3] - live2$ll[3]

#3. Using the three models below and the Amtrak ridership data,
#which model has the smallest ASE in forecasting the next year (12 months)?
#MODEL 2 has the smallest ASE at 17197.77
Amtrak = read.csv("AmtrakPassengersMonthly.csv",header = TRUE)
#Convert to a Time Series
AmtrakTS = ts(Amtrak$Ridership)
plotts.wge(AmtrakTS)
plotts.sample.wge(AmtrakTS)
#MODEL 1: AR(15)
M1_Amtrak = fore.arma.wge(AmtrakTS,phi=c(0.5511, 0.1680, -0.0145, 0.0651, 0.1388, -0.2966, 0.1539, 0.1270, -0.1815, 0.0364, 0.1456, 0.6287, -0.3832, -0.0199, -0.1679),n.ahead=12,limits=F, lastn = T)
M1_Amtrak_ASE = mean((M1_Amtrak$f-AmtrakTS[148:159])^2)
M1_Amtrak_ASE
#[1] 22588.56
#MODEL 2:
M2_Amtrak = fore.aruma.wge(AmtrakTS,phi=c(-0.02709541,  0.74213105),theta = c(-0.5844596,  0.3836931),s=12, n.ahead=12,limits=F, lastn = T)
M2_Amtrak_ASE = mean((M2_Amtrak$f-AmtrakTS[148:159])^2)
M2_Amtrak_ASE
#[1] 17197.77
#MODEL 3:
M3_Amtrak = fore.aruma.wge(AmtrakTS,phi=0.306943,theta = 0.7431719,d=1,s=12, n.ahead=12,limits=F, lastn = T)
M3_Amtrak_ASE = mean((M3_Amtrak$f-AmtrakTS[148:159])^2)
M3_Amtrak_ASE
#[1] 18399.97
