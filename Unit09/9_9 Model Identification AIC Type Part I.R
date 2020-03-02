#9_9 Model Identification AIC Type

# generate data
M1=gen.arma.wge(n=200,phi=c(.967), theta = -.477,vara=.0139)
M1=M1+2.20

# plotts.sample.wge provides a “look” at the
# data (which we recommend you always do)
plotts.sample.wge(M1)
aic.wge(M1,p=0:5,q=0:2, type='aic')

# generate data
M2=gen.arma.wge(n=200,phi=c(1.45,-.73,.261),vara=.0137)

# plotts.sample.wge provides a “look” at the
# data (which we recommend you always do)
plotts.sample.wge(M2)
aic.wge(M2,p=0:5,q=0:2, type='aic')

# fig3.16a is a realization from the AR(3) model
data(fig3.16a)
# plotts.sample.wge provides a “look” at the
# data (which we recommend you always do)
plotts.sample.wge(fig3.16a)
aic.wge(fig3.16a,p=0:5,q=0:2, type='aic')
mean(fig3.16a)

x=gen.arma.wge(n=100,phi=c(1.6,-.9),theta=.8,sn=67)
x=x+10
plotts.sample.wge(x)
# no type listed below so it will use aic
aic.wge(x,p=0:8,q=0:4)
# picks ARMA(2,1)
est.arma.wge(x,p=2,q=1)
mean(x)
