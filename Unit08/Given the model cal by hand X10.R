#Given the model:
#(1-1.65B+1.06B^2-.262B^3)X_t=a_t
#calculate X ^10(2)by hand
x <- c(5,9,13,15,14,10,12,17,20,25)

#Check the signs -/+
phi1 <- 1.65
phi2 <- -1.06
phi3 <- .262
#Last known input is x10
xHat_l_plus_0 <- x[10]
#Take one back from last know input
xHat_l_plus_Negative_1 <- x[9]
#Take two back from last know input
xHat_l_plus_Negative_2 <- x[8]
#Work in order to solve the first forcast
xHat_l_plus_1 <- phi1 * xHat_l_plus_0 + phi2 * xHat_l_plus_Negative_1 + phi3 * xHat_l_plus_Negative_2 + (1 - phi1 - phi2 - phi3)* mean(x)
#Work in order to solve the second forcast using the first one
xHat_l_plus_2 <- phi1 * xHat_l_plus_1 + phi2 * xHat_l_plus_0 + phi3 * xHat_l_plus_Negative_1 + (1 - phi1 - phi2 - phi3)* mean(x)
xHat_l_plus_2

## Verify
fore.arma.wge(x, phi = c(phi1,phi2,phi3), n.ahead = 4, lastn = FALSE, plot = TRUE, limits = TRUE)$f[2]

#Find ("by hand") the margin of error for the 95% prediction interval for X ^_10 (2).
#"By hand" here simply means to show the value of all values used in your calculation as we did in live session.   

x <- c(5,9,13,15,14,10,12,17,20,25)

phi1 <- 1.65
phi2 <- -1.06
phi3 <- .262

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