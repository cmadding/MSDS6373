library(tswge)

## Problem 1.2

#Load the west Texas crude oil dataset and the Pennsylvania monthly temperatures dataset from tswge.
#Plot the asmple autocorrelations, periodograms, and a Parzen window-based spectrial density estimate.
#Describe the behavior of the time series.

### West Texas Crude

#The line plot of the realization shows that the data exhibits a non-cyclic behavior.
#The autocorrelation plot shows that there is a strong correlation between samples that are nearby (gamma > 0.5 for k <= 13).
#The Parzen window and Periodogram show a peak at 0 with no indication of cyclic behavior.
#There is no indication of the drop after the peak of x_t = 100.


# load the west texas data
data(wtcrude)
# make the plots
plotts.sample.wge(wtcrude)


### Pennsylvania Month Temperature

#The data exhibits cyclic behavior with a peak at about 0.08 on the periodogram and Parzen window.
#We would expect to see a cyclic behavior over the year (lambda = 1/12 = 0.0.83).
#The autocorrelations appear to be slowly damped with a period of 12.


# load the west penn temperature data
data(patemp)
# make the plots
plotts.sample.wge(patemp)