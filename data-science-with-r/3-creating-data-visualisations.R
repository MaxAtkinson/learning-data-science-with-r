# Base, Lattice, ggplot2
setwd("~/dev/r")
cars <- read.csv("r-data-science/5-r-data-science-m5-exercise-files/Cars.csv")
head(cars)
library(ggplot2)

# How many cars of each transmission?
ggplot(
  data = cars,
  aes(x = Transmission)) +
  geom_bar() +
  ggtitle("Count of cars by transmission type") +
  xlab("Transmission Type") +
  ylab("Count of Cars")

# What does fuel economy look like?
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_histogram(bins = 10) +
  ggtitle("Dist. of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Count of Cars")

# How do cylinders and fuel economy relate?
ggplot(
  data = cars,
  aes(x = Fuel.Economy)) +
  geom_density() +
  ggtitle("Dist. of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Count of Cars")

ggplot(
  data = cars,
  aes(x = Cylinders, y = Fuel.Economy)) +
  geom_point() +
  ggtitle("Fuel Economy by Cylinders") +
  xlab("Number of Cylinders") +
  ylab("Fuel Economy (mpg)")

