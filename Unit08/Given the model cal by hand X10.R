library(tswge)
#Given the model:
#(1-1.65B+1.06B^2-.262B^3)X_t=a_t

#calculate X ^10(2)by hand
x <- c(5,9,13,15,14,10,12,17,20,25)

phi1 <- 1.65
phi2 <- -1.06
phi3 <- .262

X_bar=mean(x)
var(x)

#Calculate / find rho7 ?? ^_7
acf(x,plot=F)
All_Rhos = acf(x,plot=F)
Rho_0=All_Rhos$acf[1]
Rho_1=All_Rhos$acf[2]
Rho_7=All_Rhos$acf[8]

#Calulate Gamma_7
All_Gamma=acf(x, type="covariance", plot = FALSE)
Gamma_0=All_Gamma$acf[1]
Gamma_7c= All_Gamma$acf[8]

Gamma_7=Rho_7*Gamma_0

#Check the signs -/+

#Last known input is x10
xHat_l_plus_0 <- x[10]
#Take one back from last know input
xHat_l_plus_Negative_1 <- x[9]
#Take two back from last know input
xHat_l_plus_Negative_2 <- x[8]
#Work in order to solve the first forcast
xHat_l_plus_1 <- phi1 * xHat_l_plus_0 + phi2 * xHat_l_plus_Negative_1 + phi3 * xHat_l_plus_Negative_2 + (1 - phi1 - phi2 - phi3)* X_bar
#Work in order to solve the second forcast using the first one
xHat_l_plus_2 <- phi1 * xHat_l_plus_1 + phi2 * xHat_l_plus_0 + phi3 * xHat_l_plus_Negative_1 + (1 - phi1 - phi2 - phi3)* X_bar
xHat_l_plus_2

## Verify
fore.arma.wge(x, phi = c(phi1,phi2,phi3), n.ahead = 4, lastn = FALSE, plot = TRUE, limits = TRUE)$f[2]
forcast=fore.arma.wge(x, phi = c(phi1,phi2,phi3), n.ahead = 4, lastn = FALSE, plot = TRUE, limits = TRUE)

#Find ("by hand") the margin of error for the 95% prediction interval for X ^_10 (2).
#"By hand" here simply means to show the value of all values used in your calculation as we did in live session.   


psi_values <- psi.weights.wge(phi = c(phi1, phi2, phi3), lag.max = 5)
psi_0 <- 1
psi_1 <- psi_values[1]
whiteNoise_Var <- fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = FALSE)$wnv
Half_Width <- 1.96 * sqrt(whiteNoise_Var) * sqrt(psi_0^2 + psi_1^2)
Half_Width
#[1] 10.63441

## Verify
fcast <- fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = TRUE)$f
fcast[2] + Half_Width
#[1] 35.29681
fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = TRUE)$ul[2]
#[1] 35.29681

#	Write an approximation of the GLP form of this model (approximate out to a_(t-3)).
psi.weights.wge(phi = c(phi1, phi2, phi3), lag.max = 5)
#[1] 1.6500000 1.6625000 1.2561250 0.7426562 0.3294653
#X_t = a_t+ 1.65a_(t-1) + 1.6625a_(t-2) + 1.2561a_(t-3) +...+...

#Provide a plot of the realization including the first 4 forecasts with prediction limits.
#Include your R code as well.
fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = TRUE, plot = TRUE)

#Using the same model, find the factor table and paste below.
factor.wge(phi = c(phi1, phi2, phi3))

#What behavior is associated with the most dominant factor?
sample_arma=gen.arma.wge(10,phi = c(phi1, phi2, phi3))
plotts.sample.wge(sample_arma)

