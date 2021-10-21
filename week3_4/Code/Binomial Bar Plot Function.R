# This is how to make a barplot of a binomial random variable
# that shows the probabilities above each bar.
# In this case we are plotting a Bin(20, 0.5):

x <- barplot(dbinom(0:20, 20, 0.5), 
             names.arg = 0:20, ylim = c(0,1.1*max(dbinom(0:20, 20, 0.5))))
text(x, dbinom(0:20, 20, 0.5), 
     labels = round(dbinom(0:20, 20, 0.5), 5), pos = 3, col = "blue", 
     cex = 0.6)

## This is OK, but we can make life easier in the future
## by writing our own function to do this:

binom.barplot <- function(size, p = 0.5, 
                          colour = "blue", 
                          rounding = 5, 
                          cex = 0.6){
  x <- dbinom(0:size, size = size, p = p)
  xx <- barplot(x, names.arg = 0:size, ylim = c(0, 1.1*max(x)))
  text(xx, x, labels = round(x, rounding), pos = 3, col = colour, cex = cex)
}

# Now use the function like you would any other R Function:

binom.barplot(15, 0.7, colour = "blue", rounding = 6, cex = 0.7)
binom.barplot(10, 0.3, colour = "red", rounding = 4, cex = 0.8)
binom.barplot(20, 0.5, colour = "purple", rounding = 8, cex = 0.5)

