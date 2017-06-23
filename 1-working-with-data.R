# Workspace
setwd("~/dev/r")

# Read from tsv to dataframe
cars <- read.table(
  file = "r-data-science/3-r-data-science-m3-exercise-files/Cars.txt",
  header = TRUE,
  sep = "\t",
  quote = "\""
)
head(cars)

# Import dplyr
library(dplyr)

# Select these fields from cars
temp <- select(
  .data = cars,
  Transmission,
  Cylinders,
  Fuel.Economy
)
head(temp)

# Filter by transmission type 'Automatic'
temp <- filter(
  .data = temp,
  Transmission == "Automatic"
)
head(temp)

# Add a new column Consumption which is Fuel.Economy * 0.425
temp <- mutate(
  .data = temp,
  Consumption = Fuel.Economy * 0.425
)
head(temp)

# Get a grouped dataframe from our data, grouped by cylinders
temp <- group_by(
  .data = temp,
  Cylinders
)
head(temp)

# Summarise our grouped dataframe with the average fuel consumption per cylinder group
temp <- summarise(
  .data = temp,
  Avg.Consumption = mean(Consumption)
)
head(temp)

# Sort by Avg.Consumption desc
temp <- arrange(
  .data = temp,
  desc(Avg.Consumption)
)
head(temp)

# Convert 'tibble' to dataframe
efficiency <- as.data.frame(temp)
efficiency

# Do all of the above, using pipes
efficiency <- cars %>%
  select(Fuel.Economy, Cylinders, Transmission) %>%
  filter(Transmission == "Automatic") %>%
  mutate(Consumption = Fuel.Economy * 0.425) %>%
  group_by(Cylinders) %>%
  summarise(Avg.Consumption = mean(Consumption)) %>%
  arrange(desc(Avg.Consumption)) %>%
  as.data.frame()
efficiency

# Export our data to a csv
write.csv(
  x = efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE
)
