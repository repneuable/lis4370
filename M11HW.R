############################################################################
# ------ ------ ------ ------  MOD11: Debugging ------ ------ ------ ------
############################################################################
#' ---
#' title:   "MOD11: Debugging"
#' author:  "Kevin Hitt"
#' date:    "Due: April 6, 2020"
#' ---

#The code below contains a 'deliberate' bug!  

tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x))
  {
    outliers[, j] <- outliers[, j] && tukey.outlier(x[, j])
  }
  outlier.vec <- vector(length = nrow(x))
  for (i in 1:nrow(x))
  {
    outlier.vec[i] <- all(outliers[i, ])
  } 
  return(outlier.vec)
}

#Find the bug and fix it.
# -- Step 1: Execute user function with test vector v <- c(2, 3, 4, 6, 843)
#             Error in array(TRUE, dim = dim(x)) : 'dims' cannot be of length 0
#
# -- Step 2: Execute debug() function line by line
#             debug at #2: outliers <- array(TRUE, dim = dim(x))
#             
# -- Step 3: Execute user function with test matrix  m <- matrix(c(1,4,8,1483), nrow=2, ncol=2)
#             Error in tukey.outlier(x[, j]) : 
#             could not find function "tukey.outlier"
#
#             Here, I can see that the first error presented has been resolved by
#             using the correct input type, multi-dimensional. I can be concluded
#             that while the function returns a vector, the function input is meant 
#             to be matrices and dataframes rather than vectors. 

# Correct user function by removing unknown function call (tukey.outlier)
# While some resources on the web indicate this function call is valid in 
# some spaces, it does not provided any benefit to this function:

tukey_multiple_corrected <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x))
  {
    outliers[, j] <- outliers[, j] && x[, j]
  }
  outlier.vec <- vector(length = nrow(x))
  for (i in 1:nrow(x))
  {
    outlier.vec[i] <- all(outliers[i, ])
  } 
  return(outlier.vec)
}

# Generate random matrix for testing with exponential distribution
m <- matrix(rexp(200, rate=.01), ncol=10)

# Test debugged function
result <- tukey_multiple_corrected(m)

# While it is difficult to see if the function is working properly as intended
# (All columns appear to contain outlier values), however, it does execute without
# error now. 
