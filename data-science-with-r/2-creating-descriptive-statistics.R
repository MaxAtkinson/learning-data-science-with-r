setwd("~/dev/r")
cars <- read.csv("r-data-science/5-r-data-science-m5-exercise-files/Cars.csv")
head(cars)

# How many cars of each transmission type?
table(cars$Transmission)

# What does fuel economy look like?
min(cars$Fuel.Economy)
max(cars$Fuel.Economy)
median(cars$Fuel.Economy)
quantile(cars$Fuel.Economy)
sd(cars$Fuel.Economy)
sum(cars$Fuel.Economy)


# How is number of cylinders related to fuel economy
cor(
  x = cars$Cylinders,
  y = cars$Fuel.Economy
)
summary(cars)
