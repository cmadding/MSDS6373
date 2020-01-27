#Walmart Analysis

library(tidyverse) # needs to be run every time you start R and want to use %>%
library(tswge)


Walmart = read.csv("Data/Walmart.csv",header = TRUE)

Store9Item50 = Walmart %>% dplyr::filter(store == 9 & item == 50)
plotts.wge(Store9Item50$sales)
parzen.wge(na.omit(Store9Item50$sales))
parzen.wge(na.omit(Store9Item50$sales), trunc = 500)

Store9Item50_MA_5 = stats::filter(Store9Item50$sales,rep(1,5)/5)
Store9Item50_MA_51 = stats::filter(Store9Item50$sales,rep(1,51)/51)
plotts.sample.wge(na.omit(Store9Item50_MA_5))
plotts.sample.wge(na.omit(Store9Item50_MA_51))

Store9Item50_Diff_1 = diff(Store9Item50$sales,lag = 1)
plotts.sample.wge(na.omit(Store9Item50_Diff_1))
parzen.wge(na.omit(Store9Item50_Diff_1), trunc = 500)

#Walmart Butterworth

BWPass = butterworth.wge(Store9Item50$sales,order = 10,type = "pass",cutoff = c(.1,.2))
plotts.wge(BWPass$x.filt)
parzen.wge(BWPass$x.filt,trunc = 70)

BWLow = butterworth.wge(Store9Item50$sales,order = 10,type = "low",cutoff = c(.01))
plotts.wge(BWLow$x.filt)
parzen.wge(BWLow$x.filt,trunc = 70)
parzen.wge(BWLow$x.filt,trunc = 300)


#Factor Tables
# X_t - .967X_t-1 = a_t
#Factor Table
factor.wge(phi = c(.967))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(.967))

# X_t -1.452X_t-1 +.453X_t-2 +.294X_t-3 -.175X_t-4 -.237X_t-5 +.154X_t-6= a_t
#Factor Table
factor.wge(phi = c(1.452, -.453, -.294, .175, .237, -.154))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(1.452, -.453, -.294, .175, .237, -.154))

# X_t -1.445X_t-1 +.411X_t-2 +.038X_t-3 -.170X_t-4 -.362X_t-5 +.245X_t-6 +.177X_t-7 -.213X_t-8 = a_t
#Factor Table
factor.wge(phi = c(1.445, -.411, -.038, .170, .362, -.245, -.177, .213))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(1.445, -.411, -.038, .170, .362, -.245, -.177, .213))

# X_t -1.384X_t-1 +.359X_t-2 +.309X_t-3 -.063X_t-4 -.317X_t-5 +.140X_t-6 +.0587X_t-7 +.199X_t-8  -.2877X_t-9 = a_t
#Factor Table
factor.wge(phi = c(1.384, -.359, -.309, .063, .317, -.140, -.0587, -.199, .2877))

#Plotting a relization along with true
# autocorrelations and spectral density
plotts.true.wge(phi = c(1.384, -.359, -.309, .063, .317, -.140, -.0587, -.199, .2877))

