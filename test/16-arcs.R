#' test arcs

library(devtools)
load_all(".")

load("test_patterns.rda")
x <- x2
xy <- coords(x)
v <- arcs(x, r=R<-0.05)



#

# add arc
arc <- function(abc){
  xc <- c(x$x[abc[1]], x$y[abc[1]])
  a <- seq(abc[2], abc[3], length=150)
  xa <- xc[1] + R*cos(a)
  ya <- xc[2] + R*sin(a)
  points(xc[1], xc[2], col=4)
  lines(xa, ya, col=2, lwd=2)
}

symbols(x$x, x$y, circles=rep(R, x$n), inches=F, bg=3, asp=1)
plot(x$window, add=T)
apply(v, 1, arc)
