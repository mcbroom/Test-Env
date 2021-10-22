# Air Filters:

particulates <- c(24, 28, 38, 41, 32, 45, 33, 39, 50, 18,
                  15, 24, 39, 44, 17, 28, 18, 35, 22, 20)

filter <- factor(rep(c("standard", "new"), c(10, 10)))

air <- data.frame(particulates, filter)
rm(particulates, filter)

totss <- sum(particulates^2) - sum(particulates)^2/20

treatss <- sum(particulates[1:10])^2/10 +
  sum(particulates[11:20])^2/10 - 
  sum(particulates)^2/20

# Hangovers:

ba <- c(76, 52, 92, 80, 70,
        110, 96, 74, 105, 125, 
        95, 145, 100, 190, 201,
        87, 93, 91, 120, 99)

antidote <- factor(rep(c("Mashed Potato", "Milk", "Onion", "Water"), c(5, 5, 5, 5)))

totss <- sum(ba^2) - sum(ba)^2/20
totss

treatss <- sum(ba[1:5])^2/5 + 
  sum(ba[6:10])^2/5 + 
  sum(ba[11:15])^2/5 + 
  sum(ba[16:20])^2/5 -
  sum(ba)^2/20

treatss
