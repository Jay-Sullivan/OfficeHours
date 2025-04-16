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

p2 <- ggplot(data=filtered_data) +
  aes(x=Year,y=Entity,fill=num_objects) +
  ggridges::geom_density_ridges(color="black",fill="lightblue") +
  ggridges::theme_ridges(font_size = 14,
                         font_family = "Times New Roman",
                         line_size = 0.5,
                         grid = TRUE,
                         center_axis_labels = FALSE)
p2

# Beeswarm plot
filtered_data2 <- outer_space_objects %>%
  filter(Entity %in% c("Canada", "Brazil", "China"))

p3 <- ggplot(data=filtered_data2) +
  aes(x=Entity,y=num_objects,color=Entity) +
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
                   group_key="Entity",
                   count_type="full",
                   label_info="ratio",
                   label_type="circle") # try circle
p7

# much better waffle plot
filtered_data2 <- outer_space_objects %>%
  filter(Entity %in% c("Canada", "Brazil", "Germany","Denmark"))

p8 <- ggplot(data=filtered_data2) +
  aes(fill = Entity, values = num_objects) +
  waffle::geom_waffle(n_rows = 8, size = 0.33, colour = "white") +
  coord_equal() +
  theme_void()
p8




