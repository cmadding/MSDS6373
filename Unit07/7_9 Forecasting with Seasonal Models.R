#7.9 Forecasting with Seasonal Models

#Forecasts from the pure seasonal model
#(1 - B^4) Xt = at
x=gen.aruma.wge(n=20,s=4, sn = 6)
fore.aruma.wge(x,s=4,n.ahead=8,lastn=FALSE,plot=TRUE,limits=FALSE)
#Using lastn=TRUE
x=gen.aruma.wge(n=20,s=4, sn = 6)
fore.aruma.wge(x,s=4,n.ahead=8,lastn=TRUE,plot=TRUE,limits=FALSE)

#forecasts using seasonal model
#An AR term
#(1 - .8B)(1 - B^4) Xt = at
x=gen.aruma.wge(n=20,phi=.8,s=4,sn = 6)
fore.aruma.wge(x,phi=.8,s=4,n.ahead=8,limits=FALSE)
#
x=gen.aruma.wge(n=20,phi=.8,s=4,sn = 6)
fore.aruma.wge(x,phi=.8,s=4,n.ahead=8,lastn = T, limits=FALSE)

#is the 13th-order AR operator given by Parzen et al. (1980).
data(airlog)
fore.aruma.wge(airlog, d = 0, s = 12, phi = c(.74,0,0,0,0,0,0,0,0,0,0,.38,-.2812),n.ahead = 36,lastn = TRUE, limits = FALSE)

#is the 13th-order MA operator given by Box et al. (2008).
fore.aruma.wge(airlog,d = 1, s = 12, theta = c(.4,0,0,0,0,0,0,0,0,0,0,.6,-.24),n.ahead = 36,lastn = TRUE, limits = FALSE)

#is the 12th-order operator given by Woodward et al. (2017).
#No MA in this one.
phi1=c(-.36,-.05,-.14,-.11,.04,.09,-.02, .02,.17,.03,-.10,-.38)
fore.aruma.wge(airlog,phi=phi1,d=1,s=12,n.ahead=36,plot=T,lastn=T,limits=F)

#Checking the ASE
Parzen = fore.aruma.wge(airlog, d = 0, s = 12, phi = c(.74,0,0,0,0,0,0,0,0,0,0,.38,-.2812),n.ahead = 36,lastn = TRUE, limits = FALSE)
PARZEN_ASE = mean((airlog[(144-36+1):144] - Parzen$f)^2)
PARZEN_ASE

Box = fore.aruma.wge(airlog,d = 1, s = 12, theta = c(.4,0,0,0,0,0,0,0,0,0,0,.6,-.24),n.ahead = 36,lastn = TRUE, limits = FALSE)
BOX_ASE = mean((airlog[(144-36+1):144] - Box$f)^2)
BOX_ASE

Woodward = fore.aruma.wge(airlog,d = 1, s = 12, phi = c(-.36,-.05,-.14,-.11,.04,.09,-.02, .02,.17,.03,-.10,-.38),n.ahead = 36,lastn = TRUE, limits = FALSE)
WOODWARD_ASE = mean((airlog[(144-36+1):144] - Woodward$f)^2)
WOODWARD_ASE

