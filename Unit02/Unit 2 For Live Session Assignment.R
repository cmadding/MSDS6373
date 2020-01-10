#Unit 2 For Live Session Assignment

library(tswge)

#Description
#A regular time-series object containing average air temperatures at Nottingham Castle in degrees F for 20 years.

#ICC: Estimate the frequency in the Canadian Nottingham Castle data
data(nottem)

#The Parzen window-based spectral density estimate using the default truncation point (30)
parzen.wge(nottem, plot = "TRUE")

#The Parzen window-based spectral density estimate using the truncation point of 70
parzen.wge(nottem, trunc = 70)

plotts.sample.wge(nottem)
