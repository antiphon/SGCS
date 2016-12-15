#' translation weights
library(devtools)
load_all(".")
load("test_patterns.rda")



w1 <- pairdist(x1)
w1 <- c(dist(cbind(x1$x,x1$y)))
w1c <- pairwise_distances(x1)
w3 <- c(dist(x3$x))
w3c <- pairwise_distances(x3)

plot(w1-w1c, type="l")
plot(w3-w3c, type="l")
