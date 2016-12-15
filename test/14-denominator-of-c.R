#' test the denominator of c
library(devtools)
load_all(".")

load("test_patterns.rda")

par(mfrow=c(3,1))
for(x in list(x1,x2,x3)){
  v1 <- clustfun_denominator(x)
  plot(v1)
  
}


