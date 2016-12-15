# morpho Length fraction
library(devtools)
load_all(".")

load("test_patterns.rda")
x1 <- rpoispp(100)
v <- morphoLength(x1, r=seq(0,0.2, length=51))
r <- v$r

plot(v)


e <- envelope(x1, morphoLength, nsim = 29)
plot(e, xlim=c(0,0.025))
