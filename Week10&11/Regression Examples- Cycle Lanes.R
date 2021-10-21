# Enter Data:

center <- c(12.8, 12.9, 12.9, 13.6, 14.5, 14.6, 15.1, 17.5, 19.5, 20.8)
car <- c(5.5, 6.2, 6.3, 7, 7.8, 8.3, 7.1, 10, 10.8, 11)

cyclist <- data.frame(center, car)
rm(center, car)

# Plot the Data:
attach(cyclist)

plot(center, car, xlab = "Distance (feet) to Centre lane",
     ylab = "Distance (feet) of Car to Cyclist",
     main = "Scatterplot of Cyclist Data")

detach()

# Run the model using lm():

cyclist.lm <- lm(car ~ center, data = cyclist)
anova(cyclist.lm)
summary(cyclist.lm)

# Check model using residual diagnostics:

par(mfrow = c(2, 2))
plot(cyclist.lm)
par(mfrow = c(1, 1))

# Predict distance from car when lane is 17 feet from centre line:
# and also calculate 95% prediction (wide) interval:

pred <- predict(cyclist.lm, newdata = data.frame(center=17),
                interval = "pred")
pred

