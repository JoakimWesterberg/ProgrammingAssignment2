## Put comments here that give an overall description of what your
## functions do

## The function makeCacheMatrix returns a list containing four functions,
## set, get, setInverse and getInverse.
## This "list" can compute and cash the inverse of a matrix
## The function cacheSolve (see below) can then use this to either 
## get the inverse from the cache (if already calculated), or compute
## inverse. 

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() {
        x        
    }
    
    setInverse <- function(solve) {
        m <<- solve        
    }
    
    getInverse <- function() {
        m        
    }
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
    
}


## The function cacheSolve utilze the list of functions created by
## makeCacheMatrix (see above) to either fetch the already calculated
## inverse of the matrix from the cache, or to calculate it. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    
    message("nothing in cache, calculating inverse")
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
