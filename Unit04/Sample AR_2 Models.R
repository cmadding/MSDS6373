library(tswge)

# Xt -.2x_t-1 - .4X_t-2 One Positive One Negative
x = gen.arma.wge(200, phi = c(.2, .4))
plotts.sample.wge(x)

# Xt -.2x_t-1 + .8X_t-2 Two Positive
x = gen.arma.wge(200, phi = c(.2, -.8))
plotts.sample.wge(x)

# Xt +1.4x_t-1 + .48X_t-2 = a_t ->  (1+.8B)1+.6B)X_t  Two Negative
x = gen.arma.wge(200, phi = c(-1.4, -.48))
plotts.sample.wge(x)

#Lynx Data
# Xt -1.38x_t-1 + .75X_t-2 = a_t ->  (1+.8B)1+.6B)X_t  Two Negative
x = gen.arma.wge(200, phi = c(1.38, -.75))
plotts.sample.wge(x)