# morpho Area fraction
library(devtools)
load_all(".")

load("test_patterns.rda")
x <- x1
v <- morphoArea(x)

x <- internalise_pp(x)
r <- seq(0, 0.3, length=50)
resA <- .External("SGCS_morphoArea_c",
                  x,
                  r,
                  PACKAGE="SGCS"
)

windows <- lapply(r, erosion, w=x1$window)
lambdas <- sapply(windows, function(w) intensity(x1[w]) )
areas <- sapply(windows, area)


AF <- (resA/areas)#/(lambdas*pi*r^2)
  
if(!exists("G")) G <- Gest(x1, r)

### compare
plot(G, km~r, xlim=c(0,0.3))
lines(r, AF, col=5, lty=2)
