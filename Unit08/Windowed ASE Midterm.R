# Rolling Window ASE Example: midterm2020

# This idea is to calculate many ASEs and take there average by using a smaller training set and forecasting the last 'n' many times. 

#load the midterm data
midterm2020 = read.csv("midterm2020.csv",header = TRUE)
#Convert to a Time Series
midterm2020 = ts(midterm2020$x)

#Model 1
#phis = c(0.5380, 0.0606, 0.1923)
#thetas = 0
#s  = 12
#d  = 0
  
#Model 2
phis = c(1.0507,-0.0756)
thetas = c(0.5927, 0.2751)
s = 0
d = 0

trainingSize = 70
horizon = 12
ASEHolder = numeric()
dataLength=length(midterm2020)

for( i in 1:(dataLength-(trainingSize + horizon) + 1))
{
  
  forecasts = fore.aruma.wge(midterm2020[i:(i+(trainingSize-1))],phi = phis, theta = thetas, s = s, d = d,n.ahead = horizon)
  
  ASE = mean((midterm2020[(trainingSize+i):(trainingSize+ i + (horizon) - 1)] - forecasts$f)^2)
         
  ASEHolder[i] = ASE

}

ASEHolder
hist(ASEHolder)
WindowedASE = mean(ASEHolder)

summary(ASEHolder)
WindowedASE

# Visualization

i = length(ASEHolder)
fs = fore.aruma.wge(midterm2020[i:(i+(trainingSize+horizon)-1)],phi = phis, theta = thetas, s = s, d = d,n.ahead = 12, lastn = TRUE)
ASE = mean((midterm2020[(i+trainingSize):(i+(trainingSize+horizon)-1)] - fs$f )^2)
ASE
