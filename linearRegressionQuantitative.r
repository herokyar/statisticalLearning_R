#linear regression with quantitative features

#install the package one time only
#install.packages("ISLR")
#install.packages('car')

library(MASS)
library(ISLR) 

fix(Boston) #get the data popped up
names(Boston) #get the names

?Boston #learn more about the dataset

#fit a simple linear regression model
lm.fit = lm(medv~lstat, data=Boston)
attach(Boston) #get names into workspace
lm.fit=lm(medv~lstat)

lm.fit #get some basic info
summary(lm.fit) #for more details

names(lm.fit) #what other infro are stored in lm.fit

coef(lm.fit) #get the coefficients

confint(lm.fit) #confidence interval for coef estimates

predict(lm.fit, data.frame(lstat=(c(5,10,15))),
    interval='confidence') #confidence interval and prediction interval for the prediction of medv for a given value of lstat

predict(lm.fit,data.frame(lstat=(c(5,10,15))),
        interval='prediction')

plot(lstat,medv) #plot lstat vs medv
abline(lm.fit) #fit a line on the plot

#####continue with the plotting
abline(lm.fit, lwd=3) #lwd->width of regression line
abline(lm.fit, lwd=3, col='red')
plot(lstat, medv, col='red')
plot(lstat, medv, pch=20)
plot(lstat, medv, pch='+')
plot(1:20, 1:20, pch=1:20)

par(mfrow=c(2,2)) #plot into 2x2 grid of panels
plot(lm.fit)

#plot the residuals and studentized residual
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))


#multiple linear regression
#syntax is: The syntax lm(y~x1+x2+x3) #x1 x2 x3 are predictors
lm.fit = lm(medv~lstat+age, data=Boston)
summary(lm.fit)

lm.fit = lm(medv~., data=Boston) #. notation <- get all the features into the model
summary(lm.fit)

?summary.lm #get the summary
summary(lm.fit)$r.sq #gives R^2 value
summary(lm.fit)$sigma #gives RSE

library(car)
vif(lm.fit)

#age has a large p-value so removing it
lm.fit1 = lm(medv~-age, data=Boston)
summary(lm.fit1)
#also update function can be used
lm.fit1 = update(lm.fit, ~.-age)

#interaction terms (features in interaction)
summary(lm(medv~lstat*age, data=Boston))

#perform a regression of medv onto lstat and lstat^2
lm.fit2 = lm(medv~lstat+I(lstat^2))
summary(lm.fit2)

#use anova to compare 2 models
lm.fit = lm(medv~lstat)
anova(lm.fit, lm.fit2)

par(mfrow=c(2,2))
plot(lm.fit2) #there is no pattern in residuals plot

#produce polynomial fit
lm.fit5 = lm(medv~poly(lstat,5)) #upto 5th order polynomial
summary(lm.fit5)

#use log transformation
summary(lm(medv~log(rm), data=Boston))

###end of code###

































