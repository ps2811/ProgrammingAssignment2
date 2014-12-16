## Overall Functionality    : To cache inverse of a matrix and retrieve the same from cache if already present ,saving the time
## in recomputing it. makeCacheMatrix() function should be executed in order to cache the inverse.

##  makeCacheMatrix() : This function creates a special "matrix" object that can cache its inverse in a variable.It has the 
##  below functions to set the inverse in cache for a matrix.
##  get()             : It will get the input matrix                        
##  getinverse()      : It will get the cached inverse and will be called from 
##  cacheSolve() function to check inverse in cache                         
##  setinverse()      : It will assign the computed inverse to inv            

makeCacheMatrix <- function(x = matrix()) {
inv <- NULL
  set <- function(y) {
    inv <<- NULL
  }

  get <- function() {
    x
  }

  setinverse <- function(inverse) {
     inv <<- inverse
     print(inv)
  }
  getinverse <- function() {
     return(inv)
  }
  list( set = set,get = get, setinverse = setinverse, getinverse = getinverse)
}


##  cacheSolve() :  This function displays inverse of a matrix.It first checks if inverse is cached;if present then    
##  displays the inverse from cache ,else computes the inverse and displays the computed inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
    
  if(!is.null(inv)) {
    print("Cached inverse...")
    return(inv)
  }
  print("Computed inverse...")
  inputmatrix <- x$get()
  inv         <- solve(inputmatrix)
  x$setinverse(inv)
}
