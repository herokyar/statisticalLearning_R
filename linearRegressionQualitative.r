
#logistic regression
#qualitative predictors (non numerical)


#read the data part of (ISLR) library
fix(Carseats)
names(Carseats) #get the feature names

#fit a multiple regression model
lm.fit = lm(Sales~.+Income:Advertising+Price:Age, data=Carseats)
summary(lm.fit)

#return the dummy variables for ShelveLoc
attach(Carseats)
contrasts(ShelveLoc)

#writing functions
LoadLibraries = function() {
  library(ISLR)
  library(MASS)
  print('the libraries have been loaded...')
       
}

#run the function
LoadLibraries()



