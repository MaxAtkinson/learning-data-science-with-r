# Variable assignment - stick to '<-'.
x <- "Hello World"
y = "Hello World"
"Hello World" -> z

# Implicit and explicit variable assignment
print(x)
x

# Variable types
l <- TRUE
i <- 123L
n <- 1.23
c <- "ABC 123"
d <- as.Date("2001-02-03")
f <- function(x) { x + 1 }

l
i
n
c
d
f(2)

# Vectors
v <- c(1, 2, 3)
v

# Ranges
s <- 1:5
s

# Matrices
m <- matrix(
  data = 1:6,
  nrow = 2,
  ncol = 3)
m

# Arrays
a <- array(data = 1:8, dim = c(2, 2, 2))
a

# List - like mixed vector
l <- list(TRUE, 123L, 2.34, "abc")
l

# Enum style lists
categories <- c("Male", "Female", "Male", "Male")
factor <- factor(categories)
factor
levels(factor)
unclass(factor)

# Dataframes (tables)
df <- data.frame(Name = c("Cat", "Dog", "Cow", "Pig"),
                 HowMany = c(5, 10, 15, 20),
                 IsPet = c(TRUE, TRUE, FALSE, FALSE))
df

df[1, 2]
df[1,]
df[, 2]
df[["HowMany"]]
df$HowMany

df[c(2, 4), ]
df[2:4, ]
df[c(TRUE, FALSE, TRUE, FALSE), ]
df[df$IsPet == TRUE, ]
df[df$HowMany > 10, ]
df[df$Name %in% c("Cat", "Cow"), ]

# Vector addition
1 + 2
c(1, 2, 3) + c(2, 4, 6)

# Matrix comparison
m <- matrix(data = 1:6, nrow = 2, ncol = 3)
n <- matrix(1:6, 2, 3)
m == n
identical(m, n)

# Package installation
install.packages("dplyr")
library("dplyr")

# Help
?data.frame
