# How are petal length and petal width related?

# Load it up
data(iris)

# Have a peak
head(iris)

# Scatterplot
plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)

# Can we predict new petal width values?
model <- lm(
  formula = Petal.Width ~ Petal.Length,
  data = iris
)

# Look at the results of our model
summary(model)

# Draw a line of best fit
lines(
  x = iris$Petal.Length,
  y = model$fitted,
  col = "red",
  lwd = 3
)

# Check the correlation coefficient
cor(x = iris$Petal.Length, y = iris$Petal.Width)

# Let's predict new petal widths
predict(
  object = model,
  newdata = data.frame(
    Petal.Length = c(2, 5, 7)
  )
)
