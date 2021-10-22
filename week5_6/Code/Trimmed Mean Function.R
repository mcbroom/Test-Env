# Write a function to calculate a trimmed mean.
# A trimmed mean is the mean of a set of numbers
# where a certain proportion of those numbers have been
# removed from the bottom and the top.
# For example, in Olympic diving the best 2 and the worst 2
# scores are removed when calculating total score - this
# is an example of trimming.

# Start with an example, then make it a function:

x <- sample(rnorm(1000, 400, 50), 98)

# First we need to sort x from smallest to biggest:
x <- sort(x)

# Now let's try to trim the top and bottom 5% of numbers:

size <- length(x)

trim <- size*5/100

# Issue here - 5% is not a whole number- we can't trim 4.9
# observations from each end!
# We will round to the nearest whole number:

trim <- round(size * 5/100)

# So we will be removing the top 5 numbers and the bottom 5 numbers
# from x:

y <- x[-c(1:trim, (size - 0:(trim - 1)))]

# And now take the mean of the trimmed data:

mean(y)

## Now let's turn all that into a function:

trimmed.mean <- function(x, trim = 0.05){
  # Start with a check: You cannot trim more
  # than 50% of the data from each end!
  if(trim >= 0.5) stop("Trim proportion cannot be 50% or greater")
  # Sort x to start:
  x <- sort(x)
  # Now find out the length of x for when we trim it:
  size <- length(x)
  # Now get the number of items to trim, based on the trim proportion:
  num <- round(size * trim)
  # Now trim the original data from the top and bottom:
  y <- x[-c(1:num, (size - 0:(num - 1)))]
  # And finally, calculate the mean of the trimmed data:
  m.y <- mean(y, na.rm = TRUE)
  # Now print it out and make it pretty:
  cat("The ", trim*100, "% trimmed mean of the data is ", m.y, sep = "")
}


# Now let's test it:

x <- rnorm(10000)
mean(x)
trimmed.mean(x, 0)
trimmed.mean(x, 1)
trimmed.mean(x, 0.48)
trimmed.mean(x, 0.51)

