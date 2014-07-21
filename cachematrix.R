## To be able to shorten time-consuming computations, one should avoid repeating calculations by caching results.
## The pair of functions below will cache the inverse of a matrix.
##
## The "cacheSolve" function calls the "makeCacheMatrix" function to check if the cache is empty or not. 
## If it is not empty, it will use the cached results otherwise it will calculate the inverse of the matrix 
## and store it in the cache using call to "makeCacheMatrix"

## The first function, `makeCacheMatrix` creates a special "matrix", which is really a list containing a function to
##      1.  set the value of the matrix
##      2.  get the value of the matrix
##      3.  set the value of the inverse of the matrix
##      4.  get the value of the inverse of the matrix


        makeCacheMatrix <- function(x = matrix()) {
                m <- NULL
                set <- function(y) {
                        x <<- y
                        m <<- NULL
                }
                get <- function() x
                setmean <- function(mean) m <<- mean
                getmean <- function() m
                list(set = set, get = get,
                     setmean = setmean,
                     getmean = getmean)
        }


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
