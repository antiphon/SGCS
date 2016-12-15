# clustering function v2, without the P(n>1):
library(devtools)
load_all(".")

#############################################################################
## check Poisson
if(1){
  d <- 3
  set.seed(3)
  L <- 60000
  rv <- seq(0.0, 0.3 * L, length=40)
  r3 <- function(n=100) list(coord=matrix(runif(d*n,0,L), ncol=d), bbox=matrix(rep(c(0,L),d),2))
  one <- function(...)  clustfun(x=r3(), r=rv, v2=T)$c
  
  df1 <- clustfun(r3(), r=rv, v2=T)
  
  vv <- sapply(1:100, one)
  qq <- apply(vv, 1, quantile, prob=c(0.0, 0.5, 1),  na.rm=T)
  qq[2,] <- rowMeans(vv)
  df1$c<-qq[2,]
  
  
  #par(mfrow=c(2,1))
  plot(df1)
  lines(rv, qq[1,], col=3)
  lines(rv, qq[3,], col=3)
  apply(vv, 2, lines, x=rv, col=rgb(0,0,0,0.1))
}

