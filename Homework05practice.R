
################## 1. Assign to the variable n_dims a single random integer between 3 and 10
#use typeof() function

n_dims <- sample(3:10,1,replace = TRUE)
# single random integer between 3 and 10
#different function for integer values, whole numbers
# replace true means re sample it the number changes

n_dims2 <- 1:n_dims^2
# create a vector of consecutive integers from 1 to n_dims^2


n_dims3 <- sample(n_dims2)
# use sample function to randomly reshuffle values

m <- matrix(data=n_dims3,nrow= n_dims, ncol = n_dims)
# create a square matrix with these elements

print(m)
#print out the matrix

tmatrix <- t(m)
# find a function in r to transpose the matrix

print(tmatrix)
# print it out again and note how it has changed
# Notes: Matrix turns into two rows

x <- sum(tmatrix[1,])
y <- mean(tmatrix[1,])

lx <- sum(tmatrix[length(n_dims),])
ly <- mean(tmatrix[length(n_dims),])
# calculate the sum and the mean of the elements in the first row and then the last row.

# EIGEN --> ?eigen()
answer <- eigen(tmatrix)


values <- answer$values
answer <- answer$vectors
# Look carefully at the elements of $ values


typeof(values)
typeof(answer)
# IT IS XXXXX
#dig in with the typeof() function


############## 2!!! create a list with certain elements

# my_matrix 4X4 matrix filled with random uniform values
my_matrix <- matrix(sample(1:10, 16, replace = TRUE), nrow = 4)

x <- sample(1:20,100, replace = TRUE)
my_setLogical <- x > 10


# 26 element vector of all lower-case letters random order
my_letters <- sample(letters)
# difference is string before hand and putting into matrix, like creating variable
#val <- sample(1:4,4,replace = TRUE)
#my_matrix <- matrix(data=val,nrow=)
#print(my_matrix)

### HOMEWORK PART 2
#New list has element [2,2] from the matrix
newlist <- rbind(my_matrix[2,2],my_setLogical[2],my_letters[2])

typeof(newlist)

y <- c(newlist)
typeof(y)
############### 3 Create a data frame with the two variables (=columns) and 26 cases (=rows) below:
my_unis <- sample(0:10,26,replace = TRUE)
my_letters <- sample(LETTERS)
datax <- data.frame(my_unis, my_letters)
#Use sample to randomly choose 4 things out of 24
# 4 things will be position, link first thing to data frame (indexing)/ referencing
#Those will be set as NA

first <- sample(my_unis, 4, replace = FALSE)
second <- datax(sample(my))
datax$my_unis[first] <- NA
# sample and indexing will be used
# datax[sample(4),replace = NA]
missing <- which(is.na(datax$my_unis))

datanew <- datax[order(datax$my_letters), ]

meancolumn <- mean(datax$my_unis)
