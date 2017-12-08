# Medium data packages for R: FF (Flat File) or Big Memory
# - Fits medium-sized data into memory without clustering

setwd("~/dev/r/handling-big-data")
library(ff)

# Isn't in memory, creates pointers and chunks it
irisff <- read.table.ffdf(
  file = "Iris.csv",
  FUN = "read.csv"
)

# Inspect class
class(irisff)

# Inspect column names
names(irisff)

# Peek
irisff[1:5,]

# Load biglm
library(biglm)

# Cretae a big linear regression model
model <- biglm(
  formula = Petal.Width ~ Petal.Length,
  data = irisff
)

# Summarize
summary(model)

# Scatterplot it
plot(
  x = irisff$Petal.Length[], # [] required when using irisff as it's just a reference, not in memory df
  y = irisff$Petal.Width[],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)

# biglm object doesn't return a value for the fitted model, so we need to do these ourselves
# Get y-intercept
b <- summary(model)$mat[1,1]
b
# Get slope
m <- summary(model)$mat[2,1]
m

# Draw a regression line
lines(
  x = irisff$Petal.Length[],
  y = m * irisff$Petal.Length[] + b,
  col = "red",
  lwd = 3
)

# Same as before, let's predict
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7),
    Petal.Width = c(0, 0, 0) # biglm requires the target variable to be defined for some reason
  )
)

