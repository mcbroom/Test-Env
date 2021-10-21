##############################################################
#
# Read rainfall data into R manually:
#
##############################################################

rain <- c(23, 440, 800, 80,
          250, 500, 1180, 200,
          120, 400, 420, 430, 
          10, 20, 30, 5,
          60, 200, 250, 120)

# Create District variable using rep(). 
# Note that we need to make sure the way we replicate the
# values matches the way we have typed in the rain data:

district <- rep(1:5, c(4,4,4, 4,4))

# Or, when each value gets the same amount of repetition (like here, 
# where each district is repeated 4 times) we can use the "each" argument:

district <- rep(1:5, each = 4)

# Or the below does the exactly the same thing in yet another way:

district <- rep(1:5, rep(4, 5))

# This says replicate the sequence 1 to 5 (1:5) 
# 4 times each (rep(4, 5))

# Enter the Season variable:
seasons <- c("Winter", "Spring", "Summer", "Autumn")
season <- factor(rep(seasons, 5))

# Or, this does the same thing:

season <- factor(rep(c("Winter", "Spring", "Summer", "Autumn"), 5))

# Don't forget that district is also a categorical variable:

district <- factor(district)

## Now Let's put this into a data set (dataframe):

rainfall.dat <- data.frame(district, season, rain)

# And cleanup our mess (we can delete variables once we put them into a dataframe)

rm(rain, district, seasons, season)

#############################################################################
#
#                    Chi-Squared Tests
#
#############################################################################

# Goodness of Fit:

# Enter the lotto data:

lotto <- c(166, 162, 168, 158, 165, 141, 172, 184,
           159, 145, 167, 153, 151, 157, 161, 162,
           156, 158, 171, 159, 140, 161, 178, 153,
           174, 170, 130, 147, 154, 150, 158, 149,
           163, 151, 162, 163, 148, 145, 147, 161,
           170, 164, 160, 155, 152)

# The chisq.test() function does goodness of fit.
# If you only specify the data, it tests equal probability

lotto.test <- chisq.test(lotto)
lotto.test

# Enter the Credit Card data:

credit.cards <- c(70, 20, 50, 20)

# When the given probabilities vary for each category
# you must also give chisq.test() these probabilities:

creditcard.test <- chisq.test(credit.cards, p = c(0.5, 0.2, 0.25, 0.05))
creditcard.test
# You will get an error if the number of probabilities you give is not
# the same as the number of data points you have entered!

# Test Of Independence:

# Enter the data:

# Two Scenarios: 
# (1) If you already have the data as a table 
#     (like in our hair/eye colour example):

hair.eyes <- as.table(rbind(c(5, 12, 1), c(25, 2, 8), c(40, 6, 1)))
dimnames(hair.eyes) <- list(Eye = c("Blue", "Green", "Brown"), 
                            Hair = c("Brown", "Blonde", "Red"))
hair.eyes

haireye.test <- chisq.test(hair.eyes)
haireye.test

# Warning message is telling us that some of the expected cell frequencies
# are less than 5. To see which ones:
haireye.test$expected

# 4 of the 9 cells have expected cell frequencies less than 5.

# (2) If you have raw data that has not been tabulated:
# In this example (not in lecture notes) we will use data in the MASS
# Library called "survey":

library(MASS)
data(survey)
survey

# Look at the names of the variables in the survey data frame:

names(survey)

# There are some categorical variables: in particular Sex and Smoke. 
# Let's see whether sex and smoking are dependent on each other
# using the test of independence.
#
# Note that this data is "raw": it has not been tabulated.
# We must first tabulate it by the variables we are interested in
# using the table() function:

sex.smoke.tbl <- table(survey$Sex, survey$Smoke)
sex.smoke.tbl

sexsmoke.test <- chisq.test(sex.smoke.tbl)
sexsmoke.test

