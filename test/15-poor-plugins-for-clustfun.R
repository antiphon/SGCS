# compare different poor estimators for clustfun

# ratio
par(mfrow=c(3,1))

for(x in list(x1,x2,x3)){
  xx <- internalise_pp(x)
  lam <- xx$n/xx$area
  # the clustfun itself
  c1 <- clustfun(x)
  # Ratio unbiased
  t1 <- Tfun(x, r=c1$r)
  r1 <- v1 <- clustfun_denominator(x, r=t1$r)
  r1$cd <- lam^2 * t1$T/r1$cd
  # plugin
  p1<-k1 <- Kfun(x, r=c1$r)
  p1$K <- 2*t1$T/(k1$K^2 - k1$K/lam)
  #
  plot(c1, ylim=c(0,1))
  
  lines(r1$r, r1$cd, col=3)
  lines(p1$r, p1$K, col=4)
}
