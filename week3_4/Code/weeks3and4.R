# QQnorm Plot from lecture notes:

x <- rnorm(100, 10, 5)
qqnorm(x)
qqline(x)

boxplot(x)


# Binomial and Normal Probabilities:

# dbinom(x) calculates P(X = x)
# pbinom(x) calculates P(x <= x)

# Pr(X <= 2)
x <- dbinom(0:2, 6, 0.5)
sum(x)
pbinom(2, 6, 0.5)

# Pr(X = 2)
dbinom(2, p = 0.5, size = 6)

# Pr(X >= 2)
1 - pbinom(2, 6, 0.5)
sum(dbinom(3:6, 6, 0.5))

# and normals:

# Pr(X <= 1.96)
pnorm(1.96, mean = 0, sd = 1)

# Pr(0.5 <= X <= 1.96)
pnorm(1.96) - pnorm(0.5)

# Pr(X > 1.96)
1 - pnorm(1.96)

# Pr(-1.96 <= X <= 1.96)
pnorm(1.96) - pnorm(-1.96)

####################
#   Sorting Data:
####################

# Enter rainfall data again (if it is not already in your workspace)
# (this code is from the week 2 R file):

rain <- c(23, 440, 800, 80,
          250, 500, 1180, 200,
          120, 400, 420, 430, 
          10, 20, 30, 5,
          60, 200, 250, 120)

district <- factor(rep(1:5, rep(4, 5)))
season <- factor(rep(c("Winter", "Spring", "Summer", "Autumn"), 5))

rainfall.dat <- data.frame(district, season, rain)
rm(rain, district, season)

# Let's sort the rainfall.dat data by Season (alphabetically):

attach(rainfall.dat) 
#attaching the data set lets you directly use the variable names in it.

rainfall.sorted1 <- rainfall.dat[order(season), ]
rainfall.sorted1a <- rainfall.dat[order(season, decreasing = T), ]

# Now let's sort it by rainfall (smallest to largest):

rainfall.sorted2 <- rainfall.dat[order(rain), ]

# What about largest to smallest?

rainfall.sorted2a <- rainfall.dat[order(-rain), ]

# Finally, let's sort the rainfall data first by Season, then by 
# amount of rain:

rainfall.sorted3 <- rainfall.dat[order(season, rain), ]

detach()  # Always detach the data when you are done using it!!

#################################################################
#   Analysing Data Separately for each Category of a Variable
#################################################################

# Find the mean rainfall for each District:
attach(rainfall.dat)

by(rain, district, mean)

# OR:
tapply(rain, district, mean)

# Find the mean rainfall for each season:

by(rain, season, mean)

# OR
tapply(rain, season, mean)

# How about the maximum rainfall by season?

by(rain, season, max)
tapply(rain, season, max)

# What about a summary?

by(rain, season, summary)
tapply(rain, season, summary)

# A Histogram of rain per season?

#first setup the plot area so all 4 graphs show up together:
par(mfrow = c(2, 2))
#now do the graphs:
by(rain, season, hist)

#now put the graph area back where we found it:
par(mfrow = c(1, 1))

## NOTE: The previous graphs are not as good as:
boxplot(rain ~ season, data = rainfall.dat)
## If you want to see a graph of the distribution of data in 
## categories like this, use the boxplot approach.

# Don't forget to detach the data when you are done!!
detach()

