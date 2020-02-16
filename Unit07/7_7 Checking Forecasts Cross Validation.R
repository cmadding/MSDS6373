library(tswge)
data(llynx)
plotts.wge(llynx)
#Again, consider the log lynx dataset. Previously,
#we have looked at an AR(4) model for these data:

#(1 – 1.3B + 0.7B2 – 0.1B3 + 0.2B4)(Xt – 2.9) = at
#AR(4): phi = 1.3, -0.7, 0.1, -0.2
AR4f = fore.arma.wge(llynx,phi = c(1.3, -0.7, 0.1, -0.2), n.ahead = 30, limits = FALSE)

#(1 - 0.7B - 0.1B2 + 0.2B3  + 0.3B4) (Xt – 2.9) = (1 + .6B)at
#ARMA(4,1): phi = 0.7,  0.1, - 0.2,  - 0.3, theta = -.6
ARMA41f = fore.arma.wge(llynx,phi = c(0.7,0.1,-0.2,-0.3), theta = -.6, n.ahead = 30, limits = FALSE)

#But how good are these forecasts?
#We can’t know because we don’t know the actual values.

#Use lastn=TRUE to see how good the model is on real numbers.
#AR(4)
AR4f2 = fore.arma.wge(llynx,phi = c(1.3, -0.7, 0.1, -0.2), n.ahead = 30, lastn = TRUE, limits = FALSE)
#ARMA(4,1)
ARMA41f2 = fore.arma.wge(llynx,phi = c(0.7,0.1,-0.2,-0.3), theta = -.6, n.ahead = 30, lastn = TRUE, limits = FALSE)
#AR(11) by Tong in 1977
AR11tong = fore.arma.wge(llynx,phi=c(1.17, -0.54, 0.27, -0.31, 0.15, -0.15, 0.06, -0.03,0.13, 0.20, - 0.34),n.ahead=30,limits=FALSE, lastn = TRUE)


#AR(4) ASE
AR4_ASE = mean((AR4f2$f-llynx[85:114])^2)
#ARMA(4,1) ASE
ARMA41_ASE = mean((ARMA41f2$f-llynx[85:114])^2)
#AR11tong ASE (Much Better LOWER ASE)
AR11tong_ASE = mean((AR11tong$f-llynx[85:114])^2)

#7.7.3 Check
SWA = read.csv("swadelay.csv",header = TRUE)
#Convert to a Time Series
swadelay = ts(SWA$arr_delay)
plotts.wge(swadelay)
plotts.sample.wge(swadelay)

#AR(12)
AR12swadelay = fore.arma.wge(swadelay,phi=c(0.44,0.02,-0.12,0.08,-0.00,0.02,0.06,-0.09,0.06,0.07,0.02,0.37),n.ahead=30,limits=FALSE, lastn = TRUE)
#ARMA(12,1)
ARMA121swadelay = fore.arma.wge(swadelay,phi=c(0.34,0.07,-0.11,0.07,0.01,0.02,0.06,-0.09,0.05,0.07,0.02,0.39),theta = -.12,n.ahead=30,limits=FALSE, lastn = TRUE)

#AR(12) ASE (Much Better LOWER ASE)
AR12swadelay_ASE = mean((AR12swadelay$f-swadelay[148:177])^2)
AR12swadelay_ASE
#ARMA(12,1) ASE 
ARMA121swadelay_ASE = mean((ARMA121swadelay$f-swadelay[148:177])^2)
ARMA121swadelay_ASE
