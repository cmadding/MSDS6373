library(tswge)
#Given the model:
#Check the signs -/+
#(1-.5B)X_t=a_t

x <- c(10,15,20,19,14)
plotts.sample.wge(x)
phi1 <- .5
phi2 <- 0
phi3 <- 0

sigma=sqrt(var(x))
X_bar=mean(x)
Gamma_0H=var(x)*(length(x)-1)/length(x)

#Calculate / find rho1
acf(x,plot=F)
All_Rhos = acf(x,plot=F)
Rho_0=All_Rhos$acf[1]
Rho_1=All_Rhos$acf[2]
Rho_2=All_Rhos$acf[3]
Rho_4=All_Rhos$acf[5]
Rho_7=All_Rhos$acf[8]

#Calulate Gamma_7
All_Gamma=acf(x, type="covariance", plot = FALSE)
Gamma_0=All_Gamma$acf[1]
Gamma_4c= All_Gamma$acf[5]

Gamma_4=Rho_7*Gamma_0

#calculate X ^8(1)by hand
#Last known input is x8
xHat_l_plus_0 <- x[8]
#Take one back from last know input
xHat_l_plus_Negative_1 <- x[7]
#Take two back from last know input
xHat_l_plus_Negative_2 <- x[6]
#Work in order to solve the first forcast
xHat_l_plus_1 <- (phi1 * xHat_l_plus_0) + (1 - phi1)* X_bar
#Work in order to solve the second forcast using the first one
xHat_l_plus_2 <- (phi1 * xHat_l_plus_1) + (1 - phi1)* X_bar
xHat_l_plus_2

## Verify
xHat_l_plus_1C=fore.arma.wge(x,phi = phi1, n.ahead = 2)$f[1]
xHat_l_plus_2C=fore.arma.wge(x,phi = phi1, n.ahead = 2)$f[2]
forcast=fore.arma.wge(x, phi = c(phi1), n.ahead = 2, lastn = FALSE, plot = TRUE, limits = TRUE)

#Find ("by hand") the margin of error for the 95% prediction interval for X ^_8 (2).
#"By hand" here simply means to show the value of all values used in your calculation as we did in live session.   

psi_values <- psi.weights.wge(phi = c(-.7), lag.max = 5)
psi_0 <- 1
psi_1 <- psi_values[1]
whiteNoise_Var <- fore.arma.wge(x, phi = c(phi = c(-.7)), n.ahead = 4, lastn = FALSE,limits = FALSE)$wnv
Half_Width <- 1.96 * sqrt(whiteNoise_Var) * sqrt(psi_0^2 + psi_1^2)
Half_Width
#[1] 10.62366

## Verify
fcast <- fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = TRUE)$f
fcast[2] + Half_Width
#[1] 11.90607
fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = TRUE)$ul[2]
#[1] 11.90607

#	Write an approximation of the GLP form of this model (approximate out to a_(t-3)).
psi.weights.wge(phi = c(phi1, phi2, phi3), lag.max = 5)
#[1] 0.50000 0.25000 0.12500 0.06250 0.03125
#X_t = a_t+ 1.65a_(t-1) + 1.6625a_(t-2) + 1.2561a_(t-3) +...+...

#Provide a plot of the realization including the first 4 forecasts with prediction limits.
#Include your R code as well.
fore.arma.wge(x, phi = c(phi1, phi2, phi3), n.ahead = 4, lastn = FALSE,limits = TRUE, plot = TRUE)

#Using the same model, find the factor table and paste below.
factor.wge(phi = c(phi1, phi2, phi3))

#What behavior is associated with the most dominant factor?
sample_arma=gen.arma.wge(10,phi = c(phi1, phi2, phi3))
plotts.sample.wge(sample_arma)

