library(tidyverse)


gapminder_1997 <-read_csv("gapminder_1997.csv")
str(gapminder_1997)
Sys.Date
?read_csv
?str

sum(5,6)
round(3.1415, 3)
round(3, 3.1415)
round(x=3.1415, digits = 2)


install.packages("readxl")

ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap) + 
  labs(x = "GDP Per Capita") + 
  aes(y = lifeExp) + 
  labs(y = "Life Expectancy") + 
  geom_point() + 
  labs(title = "Do people in wealthy countries live longer?") + 
  aes(color = continent) + 
  scale_color_brewer(palette = "Set1") + 
  aes(size = pop/1000000) + 
  labs(size = "Populations in millions")
ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) + 
  geom_point() + 
  scale_color_brewer(palette = "Set1") + 
  labs(x = "GDP Per Capita ", y = "Life Expectancy", 
       title = "Do people in wealthy countries live longer?", 
             size = "Population (in millions)")


#Load in a larger dataset
gapminder_data <- read_csv("gapminder_data.csv")

dim(gapminder_data)

ggplot(data = gapminder_data) + 
  aes(x = year, y = lifeExp, color = continent) + geom_line()

ggplot(data = gapminder_data) + 
  aes(x = year, y = lifeExp, group = country, color = continent) + geom_line()

# Discrete plots

ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_boxplot()

ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_violin() + 
  geom_point()

ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_violin() + 
  geom_jitter()

ggplot(data = gapminder_1997) + 
  aes(x = continent, y = lifeExp) +
  geom_jitter() +
  geom_violin() 

#Master aesthetics

ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_jitter() +
  geom_violin() 

ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin() + 
  geom_jitter() 

ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin() + 
  geom_jitter(aes(size = pop), color = "pink")


ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(fill = "pink") 


ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(aes(fill = continent)) 


ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(aes(fill = "springgreen")) 


ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(fill = "springgreen") 



# Univariate plots

ggplot(gapminder_1997) + 
  aes(x = lifeExp) + 
  geom_histogram(binwidth = 50)

ggplot(gapminder_1997) + 
  aes(x = lifeExp) + 
  geom_histogram(bin = 50)


# Plot Themes 

ggplot(gapminder_1997) + 
  aes(x = lifeExp) + 
  geom_histogram(bins = 20) + 
  theme_linedraw()

#Rotate axis 
ggplot(gapminder_1997) + 
  aes(x = lifeExp) + 
  geom_histogram(bins = 20) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = 1))

# access options through help then cheatsheets

#Facetting plot into multiple plots - separate them by a variable

ggplot(gapminder_1997) + 
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point() + 
  facet_wrap(vars(continent))

#Facet grid
awesome_plot <- ggplot(gapminder_1997) + 
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point() + 
  facet_grid(rows = vars(continent))

#save the last plot you worked on 

ggsave("awesome_plot.jpg", width = 6, height = 4)

ggsave(awesome_plot,
       file = "awesome_plot.jpg",
       width = 6, height = 4)

#Excercise:
# - violin plot of continent and life expectancy, 
#-color mapped to continent
# Assigned to an object "violin_plot"
# - Black and wihite theme
#save it as "awesome_violin_plot

violin_plot <- ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp, color = continent)) +
  geom_violin(aes(fill = continent)) + 
  theme_bw()

violin_plot
ggsave(violin_plot,
       file = "awesome_violin_plot.jpg",
       width = 6, height = 4)

violin_plot <- ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(aes(fill = continent)) + 
  theme_bw()

violin_plot
