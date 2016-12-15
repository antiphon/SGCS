#' translation weights
library(devtools)
load_all(".")
load("test_patterns.rda")

## raw
ed <- function(x){
  x <- internalise_pp(x)
  bbox <- x$bbox
  x <- x$coord
  v<-sapply(1:ncol(x), function(i) pmin(bbox[2,i]-x[,i], x[,i]-bbox[1,i] ))
  apply(v,1,min)
}


####
e1 <- edge_distance(x1)
e1c <- ed(x1)

e2 <- edge_distance(x2)
e2c <- ed(x2)

e3 <- edge_distance(x3)
e3c <- ed(x3)


print( all(e1==e1c) )
print( all(e2==e2c) )
print( all(e3==e3c) )

