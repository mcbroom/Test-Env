#########################################################
#
#    Chemical and Weed Control Example
#
#########################################################

# Enter Data manually:

drymatter<- c(5.9, 4.7, 5.6, 2.5, 0.6, 1, 
              2.6, 3.7, 3.4, 2.7, 2.3, 2.9,
              4.7, 4.3, 3.8, 3.1, 4.1, 2.8,
              2, 2.4, 1.9, 5.9, 4.6, 5.5)


time <- factor(rep(rep(c("Early", "Late"), c(3, 3)), 4))
chemical <- factor(rep(LETTERS[1:4], rep(6, 4)))               

# Put variables in a dataframe and clean up:
weeds <- data.frame(drymatter, time, chemical)
rm(drymatter, time, chemical)

# Run Factorial ANOVA model:

weeds.aov <- aov(drymatter ~ time*chemical, data = weeds)
summary(weeds.aov)

# Check interaction term (time:chemical) first.
# It is significant, so we must investigate the 
# interaction term means (we cannot look at the two main effects)

# install.packages("agricolae")
library(agricolae)

weeds.interaction.LSD <- LSD.test(weeds.aov, c("time", "chemical"), console = T)
plot(weeds.interaction.LSD)

# Do an interaction plot to help interpret the results:
attach(weeds)
interaction.plot(chemical, time, drymatter, type = "l", col = c("blue", "red"), 
                 main = "Interaction Plot for Weed Control Example")
detach()

### NOTE: THE FOLLOWING IS FOR INFORMATION PURPOSES ONLY!!!
### IF THERE IS A SIGNIFICANT INTERACTION TERM
### DO NOT INVESTIGATE THE MAIN EFFECTS!!!

# Suppose we pretend the interaction term was NOT significant.
# We could then go on to investigate the two main effects:
summary(weeds.aov)

# We can see that time is significant, but chemical is not.
# We could then investigate which time means differed using the LSD:

time.LSD <- LSD.test(weeds.aov, "time", console = T)

# If chemical *were* also significant (it is not in this example)
# we would also investigate it using the LSD:

chemical.LSD <- LSD.test(weeds.aov, "chemical", console = T)

# Note how the LSD says some chemical means are different, 
# despite the F-test in the ANOVA telling us that the chemical
# main effect is not significant (ie the means do not differ).

# This is happening because we are incorrectly investigating the
# chemical main effect means when there is a significant interaction
# term present. These main effect means for chemical (and time) are 
# meaningless because of this. 

# We investigated the main effects (despite there being a significant
# interaction effect) to show you how you would look at main effects
# in R if there was not a significant interaction.

