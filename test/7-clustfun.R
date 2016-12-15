#' test connectivity function
# test 0
library(devtools)
load_all(".")

load("test_patterns.rda")

# library(SGCS)
# c1 <- clustfun(x1)
# c2 <- clustfun(x2)
# xx3 <- list(x=x3$x[,1], y=x3$x[,2], z=x3$x[,3], window=list(xrange=x3$bb[,1], y=x3$bb[,2], z=x3$bb[,3]), n=nrow(x3$x))
# c3 <- clustfun(xx3)
# save(file="clustfun_examples.rda", c1, c2, c3)

# load(file="clustfun_examples.rda")
# 
# cc1 <- clustfun(x1)#, r=c1$r)
# cc2 <- clustfun(x2)#, r=c2$r)
# cc3 <- clustfun(x3)#, r=c3$r)
# par(mfrow=c(3,1))
# plot(cc1)
# with(c1, lines(r, c, col=3))
# plot(cc2)
# with(c2, lines(r, c, col=3))
# plot(cc3)
# with(c3, lines(r, c, col=3))

#############################################################################
## check Poisson
if(1){
  d <- 3
  set.seed(3)
  rv <- seq(0.0,0.3, length=40)
  r3 <- function(n=500) list(coord=matrix(runif(d*n), ncol=d), bbox=matrix(rep(0:1,d),2))
  one <- function(...)  clustfun(x=r3(), r=rv)$c
  
  df1 <- clustfun(r3(), r=rv)
  
  vv <- sapply(1:100, one)
  qq <- apply(vv, 1, quantile, prob=c(0.0, 0.5, 1))
  qq[2,] <- rowMeans(vv)
  df1$c<-qq[2,]
  plot(df1)# ,xlim=c(0,0.05))
  lines(rv, qq[2,], type="l", col=3)
  lines(rv, qq[1,], col=3)
  lines(rv, qq[3,], col=3)
}
