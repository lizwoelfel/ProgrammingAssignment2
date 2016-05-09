## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix will create a list of functions to set and get the value of 
        ## a matrix and set and get the value of the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## Write a short comment describing this function
## cacheSolve actually calculates and solves for the inverse of the matrix 
        ## created above using the solve function in R.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}


##TESTING CODE
matrix1 <- matrix(rnorm(1:16),4,4)
matrix1
MatrixCache <- makeCacheMatrix(matrix1)
cacheSolve(CachedMatrix)
