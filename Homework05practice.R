
################## 1. Assign to the variable n_dims a single random integer between 3 and 10
#use typeof() function

n_dims <- sample(3:10,1,replace = TRUE)
# single random integer between 3 and 10
#different function for integer values, whole numbers
# replace true means re sample it the number changes

n_dims2 <- 1:n_dims^2
# create a vector of consecutive integers from 1 to n_dims^2


n_dims3 <- sample(x=n_dims2)
# use sample function to randomly reshuffle values

m <- matrix(data=n_dims3,nrow=)
# create a square matrix with these elements

print(m)
#print out the matrix

tmatrix <- t(m)
# find a function in r to transpose the matrix

print(tmatrix)
# print it out again and note how it has changed
# Notes: Matrix turns into two rows

x <- sum(tmatrix)
y <- mean(tmatrix)
# XXXXXXXXFIX
# calculate the sum and the mean of the elements in the first row and then the last row.

# EIGEN --> ?eigen()
answer <- eigen(tmatrix)

# Look carefully at the elements of $ values

#dig in with the typeof() function


############## 2 create a list with certain elements

# my_matrix 4X4 matrix filled with random uniform values
my_matrix <- matrix(runif(16), nrow = 4)



# difference is string before hand and putting into matrix, like creating variable
val <- sample(1:4,4,replace = TRUE)
my_matrix <- matrix(data=val,nrow=)
print(my_matrix)

############### 3 Create a data frame with the two variables (=columns) and 26 cases (=rows) below:
my_unis <- sample(0:10,26,replace = TRUE)

my_letters <- x
# second variable with 26 capital letters random order

#First variable single ...
