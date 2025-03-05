
spema <- sample(26:80,200, replace = TRUE) # average 27mm
spele <- sample(10:32,200, replace = TRUE) # greater then 27mm
# what is mean value for two groups and what is upper and lower value
# for two groups
# Need a box plot of the spema and spele
# Now organize them into two columns, one for spema and one for spele

ANOVA_HM2 <- aov(spema~spele)
summary(ANOVA_HM2)


m <- c(80,85,90,95,100) #changed it to seek function # seek function
for (i in 1:length(m)) {
  spema <- sample(26:m[i],200, replace = TRUE)
  ANOVA_HM2 <- aov(spema~spele)
  x <- summary(ANOVA_HM2)
  print(m[i])
  print(x[[1]]$`Pr(>F)`)
  #cat("loop number =",i,"vector element =", m,"\n")
  #cat("Loop number =",i,"Anova Results =", x,"\n")
}
# strange the higher i get the less difference there is
