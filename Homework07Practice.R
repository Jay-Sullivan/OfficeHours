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

head(iris3)

# number 5 Create an iris4 data frame from iris3 that creates a column with a sepal area (length * width) value for each observation. How many observations and variables are in the data set?

iris4 <- iris3%>%
  mutate(Sepal.area = (Sepal.Length * Sepal.Width))
# Other option: transmute(Sepal.area = (Sepal.Length * Sepal.Width))

# Number 6 Create iris5 that calculates the average sepal length, the average sepal width, and the sample size of the entire iris4 data frame and print iris5.

iris5 <- iris4%>%
  summarize(meanLength = mean(Sepal.Length, na.rm=TRUE),meanWidth = mean(Sepal.Width, na.rm = TRUE), SampleSize = n())

print(iris5)

# Number 7
# Finally, create iris6 that calculates the average sepal length, the average sepal width, and the sample size for each species of in the iris4 data frame and print iris6.

iris6 <- iris4%>%
  group_by(Species)%>%
  summarize(meanLength = mean(Sepal.Length, na.rm=TRUE),meanWidth = mean(Sepal.Width, na.rm = TRUE), SampleSize = n())

print(iris6)

# number 8
irisFinal <- iris%>%
  filter(Species == "virginica"|Species == "versicolor", Sepal.Length > 6, Sepal.Width > 2.5)%>%
  select(Species,Sepal.Length, Sepal.Width)%>%
  arrange(desc(Sepal.Length))%>%
  mutate(Sepal.area = (Sepal.Length * Sepal.Width))%>%
  group_by(Species)%>%
  summarize(meanLength = mean(Sepal.Length, na.rm=TRUE),meanWidth = mean(Sepal.Width, na.rm = TRUE), SampleSize = n())

#Create a ‘longer’ data frame using the original iris data set with three columns named “Species”, “Measure”, “Value”. The column “Species” will retain the species names of the data set. The column “Measure” will include whether the value corresponds to Sepal.Length, Sepal.Width, Petal.Length, or Petal.Width and the column “Value” will include the numerical values of those measurements.


longer <- iris%>%
  group_by(Species)%>%
  select(Species,Sepal.Length)%>%
  mutate(Measure = 'Sepal Length')%>%
  mutate(Value = Sepal.Length)%>%
  reframe(Species,Measure,Value)

