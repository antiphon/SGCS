#' Tfun T-function
library(devtools)
load_all(".")

load("test_patterns.rda")
#  library(SGCS)
#  t1 <- Tfun(x1)
#  t2 <- Tfun(x2)
#xx3 <- list(x=x3$x[,1], y=x3$x[,2], 
#            z=x3$x[,3], window=list(xrange=x3$bb[,1], y=x3$bb[,2], z=x3$bb[,3]), n=nrow(x3$x))
#t3 <- Tfun(xx3)
#save(file="T-ests.rda", t1,t2,t3)
load("T-ests.rda")

t1c <- Tfun(x1, r=t1$r)
t2c <- Tfun(x2, r=t2$r)
t3c <- Tfun(x3)
# 
par(mfrow=c(3,1))
plot(t1c)
with(t1, lines(r, T, col=5))
plot(t2c)
with(t2, lines(r, T, col=5))
plot(t3c)