## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##Please include your own comment to explain your code (Required in Rubric)

makeCacheMatrix <- function(x = matrix()) {

  b <- NULL
  set <- function(y){
  x <<- y
  b <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) b <<- inverse
  getInverse <- function() b 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}


## Write a short comment describing this function
##Please include your own comment to explain your code (Required in Rubric)

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
## Return a matrix that is the inverse of 'x'
  b <- x$getInverse()
  if(!is.null(b)){
  message("getting cached data")
  return(b)
  }
  mat <- x$get()
  b <- solve(mat,...)
  x$setInverse(b)
  j
}
