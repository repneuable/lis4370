############################################################################
# ------ ------ --- MOD5: Doing Math in R ---  ------ ------ 
############################################################################
#' ---
#' title:   "MOD5: Doing Math in R"
#' author:  "Kevin Hitt"
#' date:    "Due: February 16th, 2020"
#' ---

# Find the value of inverse of a matrix, determinant of a matrix by using the following values:
# A=matrix(1:100, nrow=10) B=matrix(1:1000, nrow=10)
# Post your result and procedure you took on your blog.
# A good start will be:
#   >A <- matrix(1:100, nrow=10)  >B <- matrix(1:1000, nrow=10)

#1. Define martices
A <- matrix(1:100, nrow=10) 
B <- matrix(1:1000, nrow=10)

#2. Find inverses of matrices
A_inv <- solve(A)
# Gives error:
# Error in solve.default(A) : 
#    Lapack routine dgesv: system is exactly singular: U[6,6] = 0

B_inv <- solve(B)
# Error in solve.default(B) : 'a' (10 x 100) must be square

# Find determinant of matrices
det(A)
# [1] 0

det(B)
# Gives error:
# Error in determinant.matrix(x, logarithm = TRUE, ...) : 
#   'x' must be a square matrix

