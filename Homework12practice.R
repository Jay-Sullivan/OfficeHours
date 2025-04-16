#Homework 10 practice


# Advanced ggplotting

# TiddyTuesday Data set link
# use something with quantitative response variable

#using r
# option 1: tidytuesday r package
# install.packaged("tidytuesdayR")

library(ggplot2)
library(ggbeeswarm)
library(beeswarm)
library(tidyverse)
library(tidytuesdayR)
library(ggmosaic)
library(dplyr)
library(tidyr)
library(ggridges)


tuesdata <- tidytuesdayR::tt_load('2024-04-23')
outer_space_objects <- tuesdata$outer_space_objects

# 10 countries, be able to read
filtered_data <- outer_space_objects %>%
  filter(Entity %in% c("Canada", "Brazil", "China", "Denmark","Argentina","Chile","Colombia","Finland","France","Germany"))
colnames(filtered_data) <- c("Country","Code","Year","Objects")
# First correct data

# Ridgeline
p2 <- ggplot(data=filtered_data) +
  aes(x=Year,y=Country,fill=Country) +
  ggridges::geom_density_ridges() +
  ggridges::theme_ridges(font_size = 14,
                         font_family = "Times New Roman",
                         line_size = 0.5,
                         grid = TRUE,
                         center_axis_labels = FALSE)
p2

# Beeswarm plot
filtered_data2 <- outer_space_objects %>%
  filter(Entity %in% c("Canada", "Brazil", "China"))
colnames(filtered_data2) <- c("Country","Code","Year","Objects")
# Second Correct Data

p3 <- ggplot(data=filtered_data2) +
  aes(x=Country,y=Objects,color=Country) +
  ggbeeswarm::geom_beeswarm(method = "center",size=1.5) +
  scale_color_manual(values = c(
    "Canada" = "cornflowerblue",
    "Brazil" = "darkolivegreen3",
    "China" = "darkred"
  )) +
  ggridges::theme_ridges(font_size = 14,
                         font_family = "Times",
                         line_size = 0.3,
                         grid = TRUE,
                         center_axis_labels = FALSE)
p3

# typical unsatisfactory pie chart
p7 <- ggpie::ggpie(data=filtered_data2,
                   group_key="Country",
                   count_type="full",
                   label_info="ratio",
                   label_type="circle") + # try circle
  ggtitle("Number of Satellites sent to Space divided by Country")

p7

# much better waffle plot
filtered_data3 <- outer_space_objects %>%
  filter(Entity %in% c("Canada", "Brazil", "Germany","Denmark"))
colnames(filtered_data3) <- c("Country","Code","Year","Objects")

p8 <- ggplot(data=filtered_data3) +
  aes(fill = Country, values = Objects) +
  ggtitle("    Number of individuals Satellites Sent to Space") +
  waffle::geom_waffle(n_rows = 8, size = 0.33, colour = "white") +
  coord_equal() +
  theme_void()
p8




