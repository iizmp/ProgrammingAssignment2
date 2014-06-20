## Put comments here that give an overall description of what your
## functions do


##This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
##caches NULL to inverse
  inverse <<- NULL
## caches x to original
  original <<- x
## function() is assigned to calcInverse
  calcInverse <- function() {
## caches the inverse of the original matrix
    inverse <<- solve(original)
  }
  
##function() is assigned to getInverse and returns the inverse
  getInverse <- function() {
    return(inverse)
  }
## list containing functions of this CacheMatrix
 
  list(calcInverse = calcInverse, getInverse = getInverse)
}


##Computes the inverse of the special "matrix" returned by makeCacheMatrix 
cacheSolve <- function(x, ...) {
##calcInverse() gets and calls calcInverse() from the list
  i <- x$calcInverse()

  ## if i is null then it returns i, otherwise it calculates and returns the inverse
  if(!is.null(i)) {
    print("inverse not null")
    return (i)
  } else {
    print("inver is null, calculating new inverse")
    x$calcInverse()
    return(x$getInverse())
  }
}
