## Caching an inversion of a matrix 


## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL # creates a varialbe called inv
      set <- function(y) { # creates a set variable, copies the matrix (uses x from the upper environment)
            x <<-  y 
            inv <<- NULL # setting inv to null
      }
      get <- function() x # getting the x matrix 
      set.inv <- function(inverse)inv <<- inverse # setting the inv matrix 
      get.inv <- function() inv # getting the inverted matrix -  after applying cacheSolve
      list(set = set, get = get,
           set.inv = set.inv,
           get.inv = get.inv) #  creating public variables
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
      inv <- x$get.inv() # gets the matrix inverse from the makeCacheMatrix function
      if(!is.null(inv)) {
            message("getting cached data")
            return(inv) # returnes inv if inverse was already cached
      }
      data <- x$get() # gets the matrix from the makeCacheMatrix function
      inv <- solve(data)
      x$set.inv(inv) # setting the inverted matrix into makeCacheMatrix
      inv
}

