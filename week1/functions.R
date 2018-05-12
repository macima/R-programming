add2 <- function(x,y){
  x+y
}

above10 <-function(x){
  use <- x > 10
  x[use]
}

above <-function(x,n =10){  ##Specifying the default n value as 10, in case the user does not specify it
  use <- x > n
  x[use]
}

columnmean <- function(y, removeNA = TRUE){
  nc <- ncol(y)
  means <- numeric(nc) 
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = removeNA)
  }
  means
}

y<-10
f<-function(x){
  y<-2
  y^2+g(x)}

f(3)
}

x<-1:10
if(x<5){
  x<-0
}
cube(3)

f<- function(x){
  g<- function(y){
    y+z
  }
    z<-4
    x+g(x)
}

