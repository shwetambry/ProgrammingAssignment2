
## These functions actually cache the inverse of a matrix.


## This functions creates a list containing functions
## to set the matrix, get the matrix, setting the inverse of matrix and getting
## cached inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL      ## We set the inverse to null.
	set <- function(y){    ## This function takes a matrix argument
		x <- y         ## and set x equal to that argument
		inv <- NULL    ## and inverse to NULL
	}
	get <- function(){     ## This function gets the value of matrix.
		x
	}
	setinv <- function(inverse){  ## This function sets the value of inverse of 
		inv <<- inverse       ## matrix equal to argument passed.
	}
	getinv <- function(){         ## This function gets the value of inverse.
		inv
	}
	list(set=set, get=get, setinv = setinv, getinv=getinv)

}



## This function returns a matrix that is the inverse of x by caching it


cacheSolve <- function(x, ...) {

        inv <- x$getinv()  ## Assigns inv the value of inverse from cache.
	if(!is.null(inv)){  ## If inv is not null then returns the inverse
		message("getting cached data")
		return(inv)
	}
	data <- x$get() ## If inv is null then assigns data the value of
	               ##  matrix by calling get function.
	inv <- solve(data)  ## Solves the inverse of the matrix.
	x$setinv(inv)      ## Caches the value of inverse.
	inv                ## Returns the inverse of matrix

}
