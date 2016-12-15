# clustering function or something bug

library(devtools)
load_all(".")

#############################################################################
##
if(1){
  d <- 2
  set.seed(3)
  n <- 200
  x <- matrix(runif(d*n), ncol=d)
  z <- internalise_pp(x)
  e<-clustfun(x)
  plot(e)  
}

