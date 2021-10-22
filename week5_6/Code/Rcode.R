## Art auction example in lecture notes:

1 - pnorm(2000, mean = 1600, sd = 220)

z <- (2000 - 1600)/220

1-pnorm(z, mean = 0, sd = 1)

# If using sample std dev, use t-distribution:

1 - pt(z, df = 9)


#########################################
#
#      T-Tests
#
#########################################

# Print out the data, note the variable names
sleep

# Do the hypothesis test:

t.test(sleep$extra, alternative = "greater", mu = 0)

# Two-Sample t-test:

t.test(extra ~ group, data = sleep)

# Paired t-test:

standing.bp <- c(132,146,135,141,139,162,128,137,145,151,131,143)
lying.bp <- c(136,145,140,147,142,160,137,136,149,158,120,150)

t.test(lying.bp, standing.bp, paired = TRUE, alternative = "two.sided")

# Same thing can be achieved using a one-sample test on the differences:

diff <- lying.bp - standing.bp
t.test(diff, alternative = "two.sided", mu = 0)

# Exercise - do a paired t-test on the sleep data:

# There are a few ways to do this. Most direct way (not necessarily the 'easiest')
# is to extract the group 1 and 2 sleep hours into two new variables, and then
# use the t-test like we did on the blood pressure data:

sleep.d1 <- sleep$extra[sleep$group == "1"]
sleep.d2 <- sleep$extra[sleep$group == "2"]

t.test(sleep.d1, sleep.d2, paired = TRUE, alternative = "two.sided")
