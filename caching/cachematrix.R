## makeCacheMatrix and cacheSolve are used to cache the inverse of a matrix

## makes a list containing a function which:
  ## sets the value of the matrix
  ## gets the value of the matrix
  ## sets the inverse of the matrix
  ## gets the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## returns the inverse of the matrix by:
  ## checking if the inverse has already been found
  ## if yes, returns result
  ## if no, computes the inverse
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return (i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
