library(tswge)
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
