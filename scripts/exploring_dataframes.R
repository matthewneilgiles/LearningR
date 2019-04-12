# Exploring Data Frames
# Episode 5 - Exploring Data Frames (continued)
#AUthor: SHaron SOlis
#Date: April 12, 2019
# UC Santa Barbara Library

# explore gapminder data set
# gapminder was downloaded in ep 2 Project Management

#READ in gapminder.csv
gapminder <- read.csv("data/gapminder_data.csv")

# insually inspect our imported data set
# click on gapminder

# STRUCTURE of gapminder
# remember data classes: int, num, factor
str(gapminder)

# SUMMARY
# Factor columns are summarized by the number of items in each level,
# numeric or integer columns are summarized by the descriptive statistics (quartiles and means)
# character columns are summarized by its length, class, and mode
summary(gapminder)





# Object Type
# what is the object type in the year column?
typeof(gapminder$year)

# LENGTH (number of columns)
length(gapminder)

# Number of rows
nrow(gapminder)

# Number of columns
ncol(gapminder)

# Dimensions
dim(gapminder)

# Column names or Titles
colnames(gapminder)

# Previewing our Dataset
# Head (remember from BASH?)
# Preview first few lines
head(gapminder, n=15)

# CHALLENGE #1
# medium
# How do you preview the last few lines of gapminder?
tail(gapminder, n=12)

# harder
# how would you preview some liens int eh middle?
gapminder[850:870,]

#below gives me median of poplation, not middle few lines
median(gapminder$pop)


#How would you preview middle lines if you didn't know the dimensions?


# Challenege #2
# Save R script
# git add, commit, pull, push