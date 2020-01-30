#5_4_Invertibility
library(tswge)

#MA(2): X_t = a_t -1.6a_t-1 +.9*a_t-2
factor.wge(phi = c(1.6,-.9))

#MA(2): X_t = a_t -1.6a_t-1 -.9*a_t-2
factor.wge(phi = c(1.6,.9))

