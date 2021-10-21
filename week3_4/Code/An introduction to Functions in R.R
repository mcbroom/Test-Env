# Make a simple function that says Hello to you if you give it your name:

hello <- function(name){
  cat("Hello", name, "you look awesome today!")
}

# Test it out:

hello("James")
hello("Edmund")
hello("Pope John Paul The Second")
hello("Queen Elizabeth III")

# Can we improve the function? Yes we can:

hello <- function(name){
  if(name == "Donald Trump") stop(name, " is not supported in R!!")
  cat("Hello", name, "you look awesome today!")
}

# Test out our new version:

hello("Esther")
hello("Xena, Warrior Princess")
hello("Dorothy The Dinosaur")
hello("Donald Trump")

# Let's try something a little more useful: Our own function to calculate
# the mean of some numbers:

my.mean <- function(x){
  # first, check that the data are numbers, not characters:
  if(is.character(x)) stop("You can't have means of characters, 
                           but you are still awesome.") 
  sum(x)/length(x) # this bit calculates the mean.
}

# Test it:
y <- rnorm(100)
my.mean(y)
mean(y) # this is R's built-in mean function to compare with ours.

my.mean(c(23, 34, 56, 12, 9))
y <- letters[1:20]
my.mean(y)
mean(y)


