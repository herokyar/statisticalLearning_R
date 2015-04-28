# create some simple user defined functions
Power = function() {
  return(2^3)
  
}
#run the function
Power()


Power2 = function(x,a){
  
  return (x^a)
}
Power2(3,8)

Power2(10,3)

Power2(8,17)

Power2(131,3)

Power3 = function(x,a){
  result = x^a
  return(result)
  
}

Power3(3,4)

####
x = 1:10
x
plot(x, Power3(x,2), log='xy', ylab='log of y = x^2', xlab='log of x', main='log of x^2 versus log of x')


PlotPower  = function(x,y){
  
  plot(x, Power3(x,y))
  
}

PlotPower(1:10, 3)

