#Homework07practice
# iris already in data

library(tidyverse)

# data(iris) lets us see 150 observations of 5 variables
data(iris)

#create iris1 data frame
#iris 1 only virginica and versicolor with sepel lengths > 6cm and sepal width > 2.5cm.
iris1 <- iris%>%
  filter(Species == "virginica"|Species == "versicolor", Sepal.Length > 6, Sepal.Width > 2.5)

# iris 2 is iris1 with only Species, Sepal length, sepal.width. How many observations and variables?
iris2 <- iris1%>%
  select(Species,Sepal.Length, Sepal.Width)

# Iris 3 data frame from 2 that orders observations largest to smallest sepal length. show first 6 rows

iris3 <- iris2%>%
  arrange(desc(Sepal.Length))

#Create an iris4 data frame from iris3 that creates a column with a sepal area (length * width) value for each observation. How many observations and variables are in the data set?

iris4 <- iris3%>%
  mutate(Sepal.area = case_when(Sepal.Length*Sepal.Width))


