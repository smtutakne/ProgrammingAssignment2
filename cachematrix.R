## The 

makeCacheMatrix function below creates a list of functions 
## to get the matrix, generate its inverse and fetch the inverse if stored in the cache. 

## The 

cacheSolve function first checks if the inverse of a given matrix is already stored in the cache. 
## If yes, it picks the inverse from the cache instead of re-calculating. 
## Else, it generates the inverse and saves it to the cache using the list of functions 
## created using the makeCachematrix functions 

## The functions assume that the provided matrix is invertible 

makeCacheMatrix<- function(x=matrix()){ 
	minv<- NULL 
	get<- function() x 
	setinv<- function(solve) minv<<- solve 
	getinv<- function() minv 
	list(get=get,setinv=setinv,getinv=getinv)
} 

cacheSolve <- function(x) {
        minv <- x$getinv()
        if(!is.null(minv)) {
                message("getting cached data")
                return(minv)
        } 
	data<- x$get() 
        minv <- solve(data)
        x$setinv(minv)
        minv
}

## create a matrix ## 
set.seed(123)
xmat<- matrix(rnorm(9),3,3)

## use functions above to check cache and upload to cache if inverse does not exist ##

mkx<- makeCacheMatrix(xmat) 
xinv<- cacheSolve(mkx)

