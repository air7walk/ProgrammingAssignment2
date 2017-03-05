## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        #Initializing inv object
        inv <- NULL
        #Replace existing matrix with new one
        set <- function(y){
                x <<- y
                inv <<- NULL
        }
#Retrieve existing matrix
get <- function() x
#Assign result of inverse calc to another object
setInverse <- function(solveMatrix) inv <<-solveMatrix
#Retrieving inverted matrix from cache
getInverse <- function() inv
#Create tag with similar name to function
list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        #Is inverted matrix of the input availalbe in cache? Return the value.
        inv <- x$getInverse()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        #Invert new matrix, save it to object "inv"
        data <- x$get()
        inv <- solve(data)
        x$setInverse(inv)
        inv
}
