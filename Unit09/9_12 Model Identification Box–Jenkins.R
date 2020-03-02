#9_12 Model Identification Box-Jenkins

library(tswge)
library(readr)
armawhatpq1 <- read_csv("armawhatpq1.csv")

#9.12.2
#Sample Partial Autocorrelations
pacf(armawhatpq1$x)
#Sample Autocorrelations
acf(armawhatpq1$x)

#9.12.3
aic5.wge(armawhatpq1$x,p=0:8,q=0:2,type="aic")
aic5.wge(armawhatpq1$x,p=0:8,q=0:2,type="bic")
#The actual model was an ARMA(3,1).
#Although we don't usually know the actual model in practice,
#we can in this setting because it was generated.

#9.12.4
inflation = read.csv("inflation.csv",header = TRUE)
pacf(inflation$Inflation)
