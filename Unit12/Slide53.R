x1.25=c( -1.03,  0.11, -0.18, 0.20, -0.99, -1.63, 1.07,  2.26, -0.49, -1.54,  0.45,  0.92,
         -0.05, -1.18,  0.90,  1.17,  0.31,  1.19,  0.27, -0.09,  0.23, -1.91,  0.46,  3.61, -0.03)
x2.25=c( -0.82,  0.54,  1.13, -0.24, -0.77,  0.22,  0.46, -0.03, -0.59,  0.45,  0.59,  0.15,
         0.60,  0.13, -0.04,  0.12, -0.96,  0.23,  1.81, -0.01, -0.95, -0.55, -0.15,  0.71,  0.90)
x1=x1.25[1:20]
x2=x2.25[1:20] 
p1=aic.wge(x1,p=0:8,q=0:0)
# aic picks p=2
x1.est=est.ar.wge(x1,p=p1$p)
fore.arma.wge(x1,phi=x1.est$phi,n.ahead=5,lastn=FALSE,limits=FALSE)
p2=aic.wge(x2,p=0:8,q=0:0)
# aic picks p=2
x2.est=est.ar.wge(x1,p=p2$p)
fore.arma.wge(x2,phi=x2.est$phi,n.ahead=5,lastn=FALSE,limits=FALSE)
#
# VAR and VARselect are from CRAN package vars
X=cbind(x1,x2)
VARselect(X, lag.max = 6, type = "const",season = NULL, exogen = NULL)
#VARselect picks p=5 (using AIC)
lsfit=VAR(X,p=5,type="const")
preds=predict(lsfit,n.ahead=5)
# preds$fcst$x1[1,1] - [5,1] are the VAR forecasts for x1.  Similar for x2
library(RColorBrewer)
fanchart(preds, colors = brewer.pal(n = 8, name = "Blues")) # Change color pallet to make distinguishable. 

summary(lsfit)
