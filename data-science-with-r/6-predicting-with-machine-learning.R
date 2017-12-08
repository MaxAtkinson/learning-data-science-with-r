data(iris)

# Create random indexes
set.seed(42)
indexes <- sample(
  x = 1:150,
  size = 100
)

print(indexes)

# Create training set from indexes
train <- iris[indexes,]

# Create test set
test <- iris[-indexes,]

# Load decision tree package
library(tree)

model <- tree(
  formula = Species ~ ., # Use all fields (.)
  data = train
)

summary(model)
plot(model)
text(model)


library(RColorBrewer)

palette <- brewer.pal(3, "Set2")

plot(
  x = iris$Petal.Length,
  y = iris$Petal.Width,
  pch = 19,
  col = palette[as.numeric(iris$Species)],
  main = "Iris Petal Length vs. Width",
  xlab = "Petal Length (cm)",
  ylab = "Petal Width (cm)"
)

partition.tree(
  tree = model,
  label = "Species",
  add = TRUE
)

predictions <- predict(
  object = model,
  newdata = test,
  type = "class"
)

# Rows = predicted.
# Columns = actual.
table(
  x = predictions,
  y = test$Species
)

library(caret)

confusionMatrix(
  data = predictions,
  reference = test$Species
)

setwd("~/dev/r/predicting-with-machine-learning/")
save(model, file = "Tree.RData")
save(train, file = "Train.RData")
