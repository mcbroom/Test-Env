# Birds Example Week 8:

# Enter data:

values <- c(105.0, 114.0, 124.7, 127.1, 127.7, 130.9,	
            9.7, 15.5, 14.9, 13.0, 13.7, 15.1,
            0.1594, 0.1193, 0.1087, 0.1097, 0.0920, 0.1242,	
            96.4, 103.4, 104.4, 115.2, 116.7, 117.7	,
            8.3, 7.1, 7.6, 10.1, 9.9, 10.1,	
            0.2171, 0.1751, 0.1707, 0.1346, 0.1672, 0.1808,	
            280.4, 290.5, 291.5, 290.7, 292.2, 326.4,	
            12.8, 13.9, 17.2, 13.8, 12.2, 19.5,	
            0.1474, 0.1447, 0.1453, 0.1342, 0.1193, 0.0821)

species <- factor(rep(c("Bridled Tern", "Black Noddy", "Crested Tern"), c(18, 18, 18)))
coefficient <- factor(rep(rep(c("K", "Tm", "R"), c(6, 6, 6)), 3))

# Put data into data set:
birds <- data.frame(species, coefficient, values)

# Remove variables to keep workspace clean:

rm(species, coefficient, values)

# Are there differences between species?

# Do an ANOVA for each coefficient:
# First subset the data out into coefficients:

birds.k <- subset(birds, coefficient == "K")
birds.tm <- subset(birds, coefficient == "Tm")
birds.r <- subset(birds, coefficient == "R")

# Then run the anovas:
anova.k <- aov(values ~ species, data = birds.k)
anova.tm <- aov(values ~ species, data = birds.tm)
anova.r <- aov(values ~ species, data = birds.r)

summary(anova.k)
summary(anova.tm)
summary(anova.r)

# They all show a significant effect of species.
# Do LSDs to see which species means differ for each coefficient:

library(agricolae)

lsd.k <- LSD.test(anova.k, "species", console = T)
plot(lsd.k)
lsd.tm <- LSD.test(anova.tm, "species", console = T)
plot(lsd.tm)
lsd.r <- LSD.test(anova.r, "species", console = T)
plot(lsd.r)
