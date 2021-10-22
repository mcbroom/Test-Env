# Simulate Data (Harvester System Example):

# Start with every data point having the overall mean value:

damage1 <- rep(55, 20)
damage1

# Now add the treatment effects for each treatment:
# Nil = +35; CS1 = +5; CS2 = -5; New = -35:

effects <- rep(c(35, 5, -5, -35), c(5, 5, 5, 5))
damage2 <- damage1 + effects
damage2

# Now add random normal error terms: e ~ N(0, sd = 10)

damage3 <- damage2 + rnorm(20, mean = 0, sd = 50)
damage3

# Do some boxplots:

harvester <- factor(rep(c("nil", "cs1", "cs2", "new"), c(5, 5, 5, 5)))

boxplot(damage3 ~ harvester)

# Hangover Cures Example:

# Enter Data into R

ba <- c(76, 52, 92, 80, 70,
        110, 96, 74, 105, 125, 
        95, 145, 100, 190, 201,
        87, 93, 91, 120, 99)

antidote <- factor(rep(c("Mashed Potato", "Milk", "Onion", "Water"), c(5, 5, 5, 5)))

# Put data into a dataset called hangovers:
hangovers <- data.frame(antidote, ba)

#Remove variables to keep workspace clean:
rm(ba, antidote)

# Run the anova model using aov() function:
hangover.model <- aov(ba ~ antidote, data = hangovers)
summary(hangover.model)

# Find which antidotes differ from each other using LSD:

# First we need to install the agricolae library:
install.packages("agricolae")

# Then we need to tell R to use the agricolae library:
library(agricolae)

# Now we have the library in R, we can use the LSD.test function:

hangovers.lsd <- LSD.test(hangover.model, "antidote", console = T)
plot(hangovers.lsd)


############ Harvester Example In Lecture Notes:

# Enter data:

perc.damage <- c(78.65, 95.67, 78.52, 97.74, 79.57,
                62.81, 54.69, 45.64, 52.43, 71.66,
                45.83, 36.58, 59.92, 42.25, 45.05,
                15.89, 35.01, 38.38, 19.82, 40.93)

harv.system <-factor(rep(c("Nil", "CS1", "CS2", "New"), c(5, 5, 5, 5)))

harvester <- data.frame(harv.system, perc.damage)
rm(perc.damage, harv.system)

harv.model <- aov(perc.damage ~ harv.system, data = harvester)
summary(harv.model)

library(agricolae)
harvester.lsd <- LSD.test(harv.model, "harv.system", console = T)
plot(harvester.lsd)

