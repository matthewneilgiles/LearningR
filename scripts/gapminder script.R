#practice for lesson
#episode 8 creating publication-quality graphics with ggplot2
#software carpentry workshop
#date: friday, april 12, 2019
#oauthor: sharon solis
#
#open ggplot2 library, we installed this morning
library(ggplot2)
#initiate new variable called gapminder, to read gapminder file in data folder


#visually inspect gapminder

#data subsetting
#looking at row 1, column 1
gapminder[1,1]
#look at row 1

#look at the tail
tail(gapminder)

#let's look at the middle
gapminder[900:905]



#call ggplot function to create new plot, GLOBAL option, applies to all layers
#aes - aesthetic properties, x & y location; looks for column headings, nice!
#geom - this layer tells how we want to visually represent data
#geom_point - scatterplot)
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + #base layer
  geom_point() #second layer - scatter plot

#easy CHALLENGE 1 THINK PAIR SHARE
#modify the line below to show how life expectancy has changed over time


#medium CHALLENGE 2 (think pair share)
#aesthetic property of color
#modify code to color the points by continent column
#what trends do you see? are they what you expected?
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + #base layer
  geom_point() #second layer - scatter plot
ggplot(data =gapminder,aes(x=year,y=lifeExp,color=continent)) + #base layer
  geom_point() #second layer - scatter plot 





####LAYERS
#scatterplot is hard to visualize change over time though
#lint plot instead
#add geom-line layerinstead of geom_point
#by aesthetic draws line for each coutnry
#added by_country within aes()
ggplot(data =gapminder,aes(x=year,y=lifeExp,by = country, color=continent)) + #base layer
  geom_line() #second layer - scatter plot 

#what if? side note: add column of countries as character, instead of factors
#introduce here as.character



#plots came out the same for coutnries read as factors vs character

#try plot for line for each continent
#added geom_line() and geom_point()
ggplot(data =gapminder,aes(x=year,y=lifeExp, by=country)) + #base layer
  geom_line(col="purple") + #line plot layer
  geom_point() #scatter plot
   


#TRANSFORMATION AND STATISTICS
#overlay statistical models over data
#going back to scatterplot, similar to our first plot
#color by continent
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + #base layer
  geom_point() #second layer - scatter plot

#currently it's hard tos ee relationships between poitns due to strong variation in GDP per capita
#let's change scale of units on X axis using scale function
#log10 function applies transofrmation to values of gdpPercap column
#each multiple of 10 now corresponds to an increase in 1 on transformed
#GDP per capita of 1,000 i now 3 on X axis
#value of 10,000 corresponds to 4 on x axis
#value of 100,000 corresponds to 5 on x axis
##
#using alpha function (transparency)
#alpha = 0.5 makes points transparent 50%
ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + #base layer
  geom_point(aes(alpha = .5)) + #second layer - scatter plot + #change transparency of points to 50%
  scale_x_log10()


ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp, color=continent)) + #base layer
  geom_point() + #second layer - scatter plot #change transparency of points to 50%
  scale_x_log10()+
  geom_smooth(method= "lm") #geom smooth layer - linear model


ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + #base layer
  geom_point(aes(color=continent)) + #second layer - scatter plot #change transparency of points to 50%
  scale_x_log10()+
  geom_smooth(method= "lm", col="black", size= 1.5) #geom smooth layer - linear model

#CHALLENGE 4a (think pair share)
#modify color and size of poitns ont eh point layer in the previous example
#hint do not use the aes function



ggplot(data = gapminder, aes(x=gdpPercap, y=lifeExp)) + #base layer
  geom_point(aes(color=continent)) + #second layer - scatter plot #change transparency of points to 50%
  scale_x_log10()+
  geom_smooth(method= "lm", col="black", size= 1.5) #geom smooth layer - linear model



#start by subsetting data
#use substr function to pull out part of character string
#letter that occur in positions start through stop
#(inthis case, looking at first letter of "A" or "Z")
#create new subset or substring called starts.with

starts.with <- substr(gapminder$country, start=1, stop=1)

#operator %in% allows us to make multiple comparisons
#create new subset called az.coutnries
az.countries <- gapminder[starts.with %in% c("A","Z"),]

#initiate ggplot
#adding line plot layer
#facet wrap took the above "formula" as its argument, denoted by ~
#this tells R to draw panel for each unique value
#in coutnry column of gapminder dataset
ggplot(data= az.countries, aes(x=year, y=lifeExp, color=continent)) +
  geom_line() +
  facet_wrap( ~ country) #facet wrap
