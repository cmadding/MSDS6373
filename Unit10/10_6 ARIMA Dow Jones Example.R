library(tswge)

data(dowjones2014)
# redefine for simplicity
dow=dowjones2014

# difference the data
dow.1=artrans.wge(dow,phi.tr=1)

aic5.wge(dow.1,p=0:5,q=0:2)
#  aic picks ARMA(4,1)
est.arma.wge(dow.1,p=4,q=1)
# $phi [1]  0.9265955  0.1355600 -0.0240474 -0.1242563
# $theta [1] 0.9999996
#  $avar [1] 12112
mean(dow)  # 16778

#Get the phi
#which factors into the following factors found using
factor.wge(phi=c(.93,.14,-.02,-.12))

aic5.wge(dow.1,p=0:5,q=0:2,type='bic')
# BIC selects p=0,q=0, i.e. white noise

#Standard Dev
SD=sd(dow.1)
#Square that to get the White noise Var
WNV=(sd(dow.1))^2

#Final model
#ARIMA(0,1,0)
#(1-B)Xt=a WNV=13036
