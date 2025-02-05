x <- 1.1
a <- 2.2
b <- 3.3

# Problem 1
y <- (x^a^b)
w <- ((x^a)^b)
m <- (3*x^3 + 2*x^2 + 1)
z <- c(y,w,m)
print(z)

# problem 2

#a
prob <- c(seq(1:8), seq(from=7, to=1))
print(prob)

# b
test <- c(1:5)
rep(x=test,times=test)
print(test)

#c
new <- seq(from=5, to=1)
test2 <- c(5:1)
rep(x=new,times=test)

#problem 3

numberx <- runif(1)
numbery <- runif(1)
r <- sqrt(numberx^2 + numbery^2)
zero <- atan(numberx/numbery)

final <- c(r, zero)
print(final)

# 4 Noah s ark

queue <- c("Sheep", "fox", "owl", "ant")
queue <- append(queue,"Serpent") #A
queue <- (queue[! queue%in% c("Sheep")]) #B
queue <- append(queue, "Donkey", 0) #C
queue <- (queue[! queue%in% c("Serpent")]) #D
queue <- (queue[! queue%in% c("owl")]) #E
queue <- append(queue, "Aphid", "ant") #F NOT WORKING

#5

