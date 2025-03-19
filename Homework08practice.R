# Homework08practice


z <- read.csv("2008_bacprods_Kling.csv",header=TRUE,sep=",")
str(z)
summary(z)


#Open Libraries
library(ggplot2) # for graphics
library(MASS) # for maximum likelihood estimation


#Read in data vector
# quick and dirty, a truncated normal distribution to work on the solution set

#z <- rnorm(n=3000,mean=0.2)
#z <- data.frame(1:3000,z)
#names(z) <- list("ID","myVar")
#z <- z[z$myVar>0,]
#str(z)
#summary(z$myVar)


#Plot histogram of data
p1 <- ggplot(data=z, aes(x=Bac_prod_ug_C_L_day, y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2)
print(p1)


#add empirical density curve
p1 <-  p1 +  geom_density(linetype="dotted",size=0.75)
print(p1)


#Get maximum likelihood parameter for normal
normPars <- fitdistr(z$Bac_prod_ug_C_L_day,"normal")
print(normPars)
str(normPars)
normPars$estimate["mean"] # note structure of getting a named attribute



#Plot normal probability density
meanML <- normPars$estimate["mean"]
sdML <- normPars$estimate["sd"]

xval <- seq(0,max(z$Bac_prod_ug_C_L_day),len=length(z$Bac_prod_ug_C_L_day))

stat <- stat_function(aes(x = xval, y = ..y..), fun = dnorm, colour="red", n = length(z$Bac_prod_ug_C_L_day), args = list(mean = meanML, sd = sdML))
p1 + stat


#Plot exponential probability density
expoPars <- fitdistr(z$Bac_prod_ug_C_L_day,"exponential")
rateML <- expoPars$estimate["rate"]

stat2 <- stat_function(aes(x = xval, y = ..y..), fun = dexp, colour="blue", n = length(z$Bac_prod_ug_C_L_day), args = list(rate=rateML))
p1 + stat + stat2
# SAYS BINS = 30 DOESNT WORK

#plot uniform probability density
stat3 <- stat_function(aes(x = xval, y = ..y..), fun = dunif, colour="darkgreen", n = length(z$Bac_prod_ug_C_L_day), args = list(min=min(z$Bac_prod_ug_C_L_day), max=max(z$Bac_prod_ug_C_L_day)))
p1 + stat + stat2 + stat3


#Plot gamma probability density
gammaPars <- fitdistr(z$Bac_prod_ug_C_L_day,"gamma")
shapeML <- gammaPars$estimate["shape"]
rateML <- gammaPars$estimate["rate"]

stat4 <- stat_function(aes(x = xval, y = ..y..), fun = dgamma, colour="brown", n = length(z$Bac_prod_ug_C_L_day), args = list(shape=shapeML, rate=rateML))
p1 + stat + stat2 + stat3 + stat4


#Plot Beta Probability density
pSpecial <- ggplot(data=z, aes(x=Bac_prod_ug_C_L_day/(max(Bac_prod_ug_C_L_day + 0.1)), y=..density..)) +
  geom_histogram(color="grey60",fill="cornsilk",size=0.2) +
  xlim(c(0,1)) +
  geom_density(size=0.75,linetype="dotted")

betaPars <- fitdistr(x=z$Bac_prod_ug_C_L_day/max(z$Bac_prod_ug_C_L_day + 0.1),start=list(shape1=1,shape2=2),"beta")
shape1ML <- betaPars$estimate["shape1"]
shape2ML <- betaPars$estimate["shape2"]

statSpecial <- stat_function(aes(x = xval, y = ..y..), fun = dbeta, colour="orchid", n = length(z$Bac_prod_ug_C_L_day), args = list(shape1=shape1ML,shape2=shape2ML))
pSpecial + statSpecial

