#https://ademos.people.uic.edu/Chapter23.html

#Our equation will be of the form:
#y=a*sin(b*t)

t <- seq(0,4*pi,,100) #sequence of 100 numbers going up by intervals of 4*pi.
a <- 3 # amplitude
b <- 2 # width of each wave

#Here is a perfect, noiseless plot of the sine wave:

plot(a*sin(b*t),type="l")