#install.packages("tswge")

library(tswge)


#West Texas Intermediate Crude Oil Prices
data(wtcrude)
ts(wtcrude, start=c(2000, 1), end=c(2009, 10), frequency=12)
class(wtcrude)
start(wtcrude)
end(wtcrude)
plot(wtcrude,type = "l",main = "West Texas Intermediate Crude Oil Prices ( January 2000 through October 2009)", ylab="Price", xlab="Month")
cycle(wtcrude)
abline(reg=lm(wtcrude~time(wtcrude)))
plot(aggregate(wtcrude,FUN=mean))

#Pennsylvania average monthly temperatures
data(patemp)
ts(patemp, start=c(1990, 1), end=c(2004, 12), frequency=12)
start(patemp)
end(patemp)
plot(patemp,type = "b",main = "Pennsylvania Average Monthly Temperatures (January 1990 to December 2004)", ylab="Temperature (Degrees Fahrenheit)", xlab="Month")
abline(reg=lm(patemp~time(patemp)))

data("airline")
plot(airline,type = "l")
data("cement")
plot(cement,type = "l")
data("chirp")
plot(chirp,type = "l")

#Whale click data
data("whale")
plot(whale,type = "l")
