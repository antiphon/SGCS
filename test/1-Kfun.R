#' test K-function
library(devtools)
load_all(".")

load("test_patterns.rda")

# library(spatstat)
# k1 <- Kest(x1)
# k2 <- Kest(internal_to_ppp(x2))
# library(Kdirectional)
# k3 <- Kest_directional(x3, c(0,0,1), pi/2, r=k2$r)
# save(file="Kests.rda", k1,k2,k3)
load("Kests.rda")

k1c <- Kfun(x1, r=k1$r)
k2c <- Kfun(x2, r=k1$r)
k3c <- Kfun(x3, r=k1$r)

par(mfrow=c(3,1))
with(k1, plot(r, trans))
with(k1c, lines(r, K, col=3))
with(k2, plot(r, trans))
with(k2c, lines(r, K, col=3))
with(k3, plot(r, trans))
with(k3c, lines(r, K, col=3))

