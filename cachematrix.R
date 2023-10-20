# Create a function to cache a matrix and its inverse
makeCacheMatrix <- function(initialMatrix = matrix()) {
  # Initialize matrix and its inverse to NULL
  cachedMatrix <- NULL
  cachedInverse <- NULL
  
  # Set the matrix and invalidate the cached inverse
  set <- function(newMatrix) {
    cachedMatrix <<- newMatrix
    cachedInverse <<- NULL
  }
  
  # Get the cached matrix
  get <- function() cachedMatrix
  
  # Set the cached inverse
  setInverse <- function(inverse) cachedInverse <<- inverse
  
  # Get the cached inverse
  getInverse <- function() cachedInverse
  
  # Return a list of functions for working with the cache
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# Function to compute the inverse of a cached matrix
cacheSolve <- function(cache, ...) {
  # Try to get the cached inverse
  cachedInverse <- cache$getInverse()
  
  # If the cached inverse is available, return it
  if (!is.null(cachedInverse)) {
    message("Retrieving cached data")
    return(cachedInverse)
  }
  
  # If the cached inverse is not available, compute it
  cachedMatrix <- cache$get()
  cachedInverse <- solve(cachedMatrix, ...)
  
  # Set the cached inverse
  cache$setInverse(cachedInverse)
  
  cachedInverse
}
