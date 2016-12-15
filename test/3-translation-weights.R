#' translation weights
library(devtools)
load_all(".")
load("test_patterns.rda")



w1 <- translation_weights(x1)
w1c <- translation_weights(x1, TRUE)
w2 <- translation_weights(x2)
w2c <- translation_weights(x2, TRUE)

par(mfrow=c(2,1))

plot(w1-w1c, type="l")
plot(w2-w2c, type="l")
