# morpho Euler fraction
library(devtools)
load_all(".")

#load("test_patterns.rda")
x1 <- rpoispp(1000)
v <- morphoEuler(x1, r = seq(0,.05, length=10))
r <- v$r

plot(v)


#e <- envelope(x1, morphoEuler, nsim = 29)
#plot(e)
