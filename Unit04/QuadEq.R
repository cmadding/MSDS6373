
#quadratoic
withSign<-function(x){
  ifelse(sign(x)==1,paste0('+',x),x)
}

qeq<-function(a,b,c){
  ac<-as.complex(a); bc<-as.complex(b); cc<-as.complex(c)
  s1 = (-bc + sqrt(bc^2 - 4*ac*cc))/(2*ac)
  s2 = (-bc - sqrt(bc^2 - 4*ac*cc))/(2*ac)
  z = sqrt(Re(s1)^2+as.numeric(Im(s1))^2)
  eq=paste0('',a,'Z^2',withSign(b),'Z',withSign(c),'=0'
            ,'; r=(',-b,'+-\\sqrt(',b,'^2-4*',a,'*',c,'))/(2*',a,')'
            ,' = (',-b,'+-\\sqrt(',b^2-4*a*c,'))/(',2*a,')'
            ,' = (',-b,'+-(',round(sqrt(bc^2-4*ac*cc),4),'))/(',2*a,')'
            ,' = ',-b,'/',round(2*a,4),'+-(',round(sqrt(bc^2-4*ac*cc),4),')/',2*a
            ,' = ',round(-b/(2*a),4),'+-(',round(sqrt(bc^2-4*ac*cc)/(2*ac),4),')'
            ,'; r1=', round((-bc + sqrt(bc^2 - 4*ac*cc))/(2*ac),4)
            ,'; r2=', round((-bc - sqrt(bc^2 - 4*ac*cc))/(2*ac),4)
  )
  message("Equation: ",eq)
  freq=   ifelse(Im(s2)==0,0,(1/(2*pi))*acos(-b/(2*sqrt(+a))))
  freqEq = ifelse(freq==0,'',
                  paste0('f_0=1/(2\\pi)*cos^(-1)(\\phi_1/(2*\\sqrt(-\\phi_2)))'
                         ,'=1/(2\\pi)*cos^(-1)(',-b,'/(2*\\sqrt(',+a,'))'
                         ,'=',round(freq,4))
  )
  message("\nFrequency Equation: ",freqEq)
  return(list(
    equation=eq
    ,sols=c(s1,s2)
    ,phi=c(1/s1, 1/s2)
    ,z=z
    ,freq=freq
    ,freqEq = freqEq)
  )
}

#cX_t -bX_t-1 -aX_t-2 = at
#X_t -.4X_t-1 -.12X_t-2 = at
#quq(a,b,c)
qeq(-0.12,-0.4,1)

#X_t -1.4X_t-1 +.48X_t-2 = at
qeq(0.48,-1.4,1)
factor.wge(phi = c(1.4, -0.48))

#Logged Lynx data
#(1-1.38z+.75z2)
data(lynx)
qeq(0.75,-1.38,1)
factor.wge(phi = c(1.38, -.75))
plotts.true.wge(n=100,c(1.38, -.75))

#AR(3)
factor.wge(phi = c(1.95, -1.85,.855))
plotts.true.wge(phi=c(1.95, -1.85,.855))

#AR(4)
factor.wge(phi = c(1.6, -.23,-1,.576))
plotts.true.wge(phi=c(1.6, -.23,-1,.576))

