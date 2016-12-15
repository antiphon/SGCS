#' test Poisson-scaled connectivity function
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
  d <- 2
  set.seed(3)
  rv <- seq(0.0, 0.3, length=40)
  r3 <- function(n=100) list(coord=matrix(runif(d*n), ncol=d), bbox=matrix(rep(0:1,d),2))
  one <- function(...)  clustfun(x=r3(), r=rv, scaled=TRUE)$c
  
  df1 <- clustfun(r3(), r=rv, scaled=TRUE)
  
  vv <- sapply(1:100, one)
  qq <- apply(vv, 1, quantile, prob=c(0.0, 0.5, 1),  na.rm=T)
  qq[2,] <- rowMeans(vv)
  df1$c<-qq[2,]
  
  
  par(mfrow=c(2,1))
  plot(df1, ylim=c(0,2))
  lines(rv, qq[1,], col=3)
  lines(rv, qq[3,], col=3)
  apply(vv, 2, lines, x=rv, col=rgb(0,0,0,0.1))
#############################################################################
## compare to pcf
  d <- 2
  set.seed(3)
  aspp <- function(x) ppp(x$c[,1],x$c[,2])
  rv <- seq(0.0, 0.3, length=40)
  one2 <- function(...) pcf(aspp(r3()), r=rv)$trans
  
  df2 <- pcf(aspp(r3()), r=rv)
  
  ww <- sapply(1:100, one2)
  qq2 <- apply(ww, 1, quantile, prob=c(0.0, 0.5, 1),  na.rm=T)
  qq[2,] <- rowMeans(ww)
  df2$trans<-qq2[2,]
  plot(df2, ylim=c(0,2), cbind(trans,theo)~r)
  lines(rv, qq2[1,], col=3)
  lines(rv, qq2[3,], col=3)
  apply(ww, 2, lines, x=rv, col=rgb(0,0,0,0.1))
}

