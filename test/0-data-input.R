# test 0
library(devtools)
load_all(".")
library(spatstat)

x <- rpoispp(100)
y <- internalise_pp(x)



# generate example cases
set.seed(1)
library(spatstat)
x1  <- rStrauss(100, 0.1, 0.05, W = as.owin(c(0,2,0,4)))
x2  <-rpoispp(100)
library(rstrauss)
x3  <- rstrauss(300, 0.1, 0.1, perfect=TRUE, bbox=matrix(c(0,2,0,1.5,0,1),2))
save(file="test_patterns.rda", x1, x2, x3)
