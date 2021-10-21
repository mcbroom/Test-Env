# Regression Examples from Lecture notes weeks 10/11

# 1. House Prices:

# Enter data manually:

distance <- c(1.2, 0.8, 1, 1.3, 0.7, 0.3, 1, 0.6, 0.9, 1.1)
price <- c(101, 92, 110, 120, 90, 51, 93, 75, 77, 120)

# Put in a dataframe and cleanup:

house.prices <- data.frame(distance, price)
rm(distance, price)

# Always graph the data first to visualise the 
# relationship between x and y. We are looking to 
# see if the overall relationship is approximately 
# linear (in our case, this means a straight-ish line).

attach(house.prices)

plot(x = distance, y = price, 
     xlab = "Distance (km) from Abattoir",
     ylab = "House Price (x $1000)", 
     main = "House Prices vs Distance from Abattoir"
)

detach()

# Now Run the Regression:

house.lm <- lm(price ~ distance, data = house.prices)

# Get the anova table:
anova(house.lm)

# Get the coefficient estimates table:
summary(house.lm)

# Plot the model fit to assess whether the model
# assumptions have been met:
par(mfrow = c(2, 2))
plot(house.lm)
par(mfrow = c(1, 1))

### Finally, we can use the model to predict house prices
# at distances we didn't measure (beware extrapolations!!):

# First, create the x values (distances) that we want to predict
# the housing prices for:

new.distances <- data.frame(distance = c(0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4, 1.5))

# Now use the fitted model to predict prices at these values:

# First using "narrow" confidence intervals:

narrow.preds <- predict(house.lm, newdata = new.distances, interval = "conf")

# Next using the "wide" prediction intervals:

wide.preds <- predict(house.lm, newdata = new.distances, interval = "pred")

# We can even plot these predictions and intervals on a graph:

# First, set up the plot area so it can capture all the data:

plot(new.distances$distance, wide.preds[,"fit"], 
     ylim = c(min(wide.preds[, "lwr"]), max(wide.preds[, "upr"])), 
     type = "n", 
     xlab = "Distance (km)", 
     ylab = "Predicted House Prices (x $1000)",
     main = "Predicted House Prices for Various Distances")

# Now add the data values to the graph as points:
points(x = house.prices$distance, y = house.prices$price)

# Add the line of best fit to these points:
abline(house.lm, col = "lightblue")

# Now add the wide prediction intervals to this graph as lines:
lines(x = new.distances$distance, y = wide.preds[, "lwr"], col = "red", lty = 2)
lines(x = new.distances$distance, y = wide.preds[, "upr"], col = "red", lty = 2)

# Finally, add the narrow confidence intervals for the predictions:
lines(x = new.distances$distance, y = narrow.preds[, "lwr"], col = "blue", lty = 2)
lines(x = new.distances$distance, y = narrow.preds[, "upr"], col = "blue", lty = 2)

# Add a legend:
legend("bottomright", legend = c("95% Prediction Interval", "95% Confidence Interval"),
       lty = c(2, 2), col = c("red", "blue"))

