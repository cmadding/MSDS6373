#Unit 7: For Live Session

#1. Which model do you think is appropriate to use to forecast your time series? Why?
#R Data
data(nottem)
plotts.sample.wge(nottem)
fore.aruma.wge(nottem,s=12,n.ahead=12,lastn=F,plot=T,limits=FALSE)

#2. Find the first 5 psi weights for the model below, and use them to find the
#half-width of the 95 percentile probability interval for the third forecast (Xhat(3)).
#Please show your work as well as a plot of the series and the first eight forecasts with probability intervals.
#(1–.9B)(1–.8B)Xt = at
#X1 = 5 X2 = 8 X3 = 9 X4 = 8 X5 = 7 X6 = 6 X7 = 4 X8 = 3
psi=psi.weights.wge(phi = c(-.9,-.8), lag.max = 5)
psi
#First 5 psi weights: -0.90000  0.01000  0.71100 -0.64790  0.01431
live2=gen.arma.wge(n=50,phi=c(-.9,-.8))
#get the white noise variance from the aic information on the live2 data.
live2aic=aic.wge(live2)
live2aic$vara
#White Noise Variance = 0.733172
#half width third forecast (Xhat(3))
(1.96*live2aic$vara)*sqrt(1^2 + (psi[1])^2 + (psi[2])^2+ (psi[3])^2)
#The half width if the third forecast (Xhat(3)) = 2.186733
fore.arma.wge(live2,phi=0.306943,theta = 0.7431719, n.ahead=8,limits=T, lastn = F)

#3. Using the three models below and the Amtrak ridership data,
#which model has the smallest ASE in forecasting the next year (12 months)?
#MODEL 1 has the smallest ASE at 22588.56
Amtrak = read.csv("AmtrakPassengersMonthly.csv",header = TRUE)
#Convert to a Time Series
AmtrakTS = ts(Amtrak$Ridership)
plotts.wge(AmtrakTS)
plotts.sample.wge(AmtrakTS)
#MODEL 1:
M1_Amtrak = fore.arma.wge(AmtrakTS,phi=c(0.5511, 0.1680, -0.0145, 0.0651, 0.1388, -0.2966, 0.1539, 0.1270, -0.1815, 0.0364, 0.1456, 0.6287, -0.3832, -0.0199, -0.1679),n.ahead=12,limits=F, lastn = T)
M1_Amtrak_ASE = mean((M1_Amtrak$f-AmtrakTS[148:159])^2)
M1_Amtrak_ASE
#[1] 22588.56
#MODEL 2:
M2_Amtrak = fore.arma.wge(AmtrakTS,phi=c(-0.02709541,  0.74213105),theta = c(-0.5844596,  0.3836931), n.ahead=12,limits=F, lastn = T)
M2_Amtrak_ASE = mean((M2_Amtrak$f-AmtrakTS[148:159])^2)
M2_Amtrak_ASE
#[1] 59990.47
#MODEL 3:
M3_Amtrak = fore.arma.wge(AmtrakTS,phi=0.306943,theta = 0.7431719, n.ahead=12,limits=F, lastn = T)
M3_Amtrak_ASE = mean((M3_Amtrak$f-AmtrakTS[148:159])^2)
M3_Amtrak_ASE
#[1] 87303.4
