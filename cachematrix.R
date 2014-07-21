## To be able to shorten time-consuming computations, one should avoid repeating calculations by caching results.

## The "cacheSolve" function calls the "makeCacheMatrix" function to check if the cache is empty or not.
## If it is not empty, it will use the cached results otherwise it will calculate the inverse of the matrix 
## and store it in the cache created by "makeCacheMatrix". This function contains all methods to manipulate this cache.

## The first function, `makeCacheMatrix` returns the called function such as set/get value of matrix and set/get the inverse.
## These are called from the second function cacheSolve. In fact, you can think about these returned functions as methods of the cache "object".

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## The second function "cacheSolve" returns the inverse of "x". 
## If the inverse has already been calculated (and the matrix has not changed), then "cacheSolve" retrieves the inverse from the cache.

cacheSolve <- function(x) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve (data)
        x$setinverse(m)
        m
}    

## To test on the R-Console, you can use the following example in :
##      x <- matrix(c(1.2,2.4,2.3,3.4), ncol=2, nrow=2)
##      m1 <- makeCacheMatrix(x)
##      cachemethods$get()
##      cacheSolve(m1)
