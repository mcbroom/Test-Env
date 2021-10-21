# Enter Data:

DO <- c(45.8,	67.9,	54.6,	51.9,	32.7,	62.3,	71.3,	78.9,	38.7,	49.7)
temp <- c(27.9,	16.5,	22.3,	24.8,	31.2,	18.5,	13.1,	10.7,	29.1,	22.1)

rivers <- data.frame(DO, temp)
rm(DO, temp)

# Plot the Data:

attach(rivers)

plot(temp, DO, xlab = "Temperature (Degrees C)",
     ylab = "Dissolved Oxygen (%)",
     main = "Scatterplot of DO vs Temperature")

detach()

# Fit the model to the data:

do.lm <- lm(DO ~ temp, data = rivers)

anova(do.lm)
summary(do.lm)

# Check model using residual diagnostics:

par(mfrow = c(2, 2))

plot(do.lm)

par(mfrow = c(1, 1))


# Predict at temp = 30 and temp = 9.
# Use 95% "wide" prediction intervals:

do.preds <- predict(do.lm, 
                    newdata = data.frame(temp = c(9, 30)),
                    interval = "pred")
do.preds

