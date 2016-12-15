#' test connectivity function
# test 0
library(devtools)
load_all(".")

load("test_patterns.rda")

CC1 <- confun(x1, h=0)
C1 <- confun(x1)
CC2 <- confun(x2, h=0)
C2 <- confun(x2)

CC3 <- confun(x3, h=0, R=0.15)
C3 <- confun(x3, R=0.15, h=0.1, r=seq(0,.3, length=30))


par(mfrow=c(3,2))

plot(CC1)
plot(C1)
plot(CC2)
plot(C2)
plot(CC3)
plot(C3)