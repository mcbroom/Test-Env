# Before running this code, open the rainfall excel spreadsheet
# from the L@G site in the week 1 lecture notes folder. Select all
# the data (including the row with the column names) and copy it
# to your clipboard. Then choose the code that matches your operating
# system from the two choices below (put your cursor on the line of code) 
# and run it using the run button (above right).

rainfall <- read.table("clipboard", header = T) # Windows
rainfall <- read.table(pipe("pbpaste"), header= T) # Mac

# As long as you save everything when you exit RStudio, you will never
# have to use the code above again - the data will be here the next time
# you open R/RStudio in this project space.

rainfall
rainfall$Rainfall
rainfall$Season

summary(rainfall)
summary(rainfall$Rainfall)
table(rainfall$Season)

hist(rainfall$Rainfall, main = "Histograms are for numerical variables like rainfall")
boxplot(rainfall$Rainfall, main = "So are Boxplots")
boxplot(Rainfall ~ Season, data = rainfall, main = "You can do boxplots by a category as well")

qqnorm(rainfall$Rainfall, main = "A Normal QQ plot visually checks for normality")
qqline(rainfall$Rainfall, lty = 2) 
title(main = "Do the majority of points lie along the line?", line = 0.5)
title(main = list("No, no they do not... :(", cex = 0.7, col = "red", font = 3), 
      line = -1)

season.table <- table(rainfall$Season)
season.table
barplot(season.table, main = "Barcharts Are for Categorical Variables")
pie(season.table/sum(season.table), col = rainbow(4), main = "DO NOT Use Pie Charts - Pie Charts are BAD!!!")
dotchart(as.numeric(season.table), main = "A dot chart is also OK. (Don't use pie charts!)")

