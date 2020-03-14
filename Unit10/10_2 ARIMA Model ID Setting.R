library(tswge)

data("dowjones2014")

aic5.wge(dowjones2014, p=0:5,q=0:2)
mean=mean(dowjones2014)
