#SWA Delay Analysis

library(tswge)

# Read in the data
SWA = read.csv("Data/swadelay.csv",header = TRUE)
plotts.wge(SWA$arr_delay)
plotts.sample.wge(SWA$arr_delay)
aic5.wge(SWA$arr_delay)

#5.6.4 check
#What is the most preferred model with respect to the AIC for the
#Southwest Airlines monthly number of flights delayed because of the weather
#(column: weather_delay)?

aic5.wge(SWA$weather_delay)

#an ARMA(4,1) with an AIC of 14.90084