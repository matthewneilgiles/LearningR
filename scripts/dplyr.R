#my other script

rm(list=ls())

library(dplyr)

gapminder <- read.csv("data/gapminder_data.csv")
str(gapminder)



#using select function to pick certain columns
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
str(year_country_gdp)

#using filter function to pick certain rows
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
str(year_country_gdp_euro)

#using dplyr for grouping variables
gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp=mean(gdpPercap))
gdp_by_continent

gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp=mean(gdpPercap))

life_expectancy_by_Country <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp=mean(lifeExp))
life_expectancy_by_Country %>%
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))

## integrating GGplot and Dplyr
gapminder %>%
  group_by(country, year) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  ggplot (aes(x=year, y=mean_lifeExp, color=country)) + geom_point()


