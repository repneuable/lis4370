#' ---
#' title: "Mod 4 - Programming Structure"
#' author: "Kevin Hitt"
#' date: "Due: February 10th, 2020"
#' ---

# Declare provided data vectors
freq <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
bloodp <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
first <- c("bad","bad","bad","bad","good","good","good","good",NA,"bad")
second <- c("low","low","high","high","low","low","high","high","high","high")
finaldecision <- c("low","high","low","high","low","high","low","high","high","high")

# Clean categorical vectors for boxplotting

#_Create function for "bad" and "good" values
bad_and_good <- function(x) {
  if(x == "bad" || is.na(x)) { x <- 1 }
  else { x <- 2 }
}

#_Create function for "low" and "high" values
low_and_high <- function(x) {
  if(x == "low" || is.na(x)) { x <- 1 }
  else { x <- 2 }
}

first.num <- sapply(first, bad_and_good)
second.num <- sapply(second, low_and_high)
final.num <- sapply(finaldecision, low_and_high)

# Create dataframe
medical <- data.frame(freq, bloodp, first.num, second.num, final.num)
names(medical) <- c("freq", "bp", "first", "second", "final")

# Plot boxplots
boxplot(medical$bp~medical$first, xlab="1 = Bad Assessment (Internal)  2 = Good Assessment (Internal)", ylab="Blood Pressure")
boxplot(medical$bp~medical$second, xlab="1 = Low Assessment (External)   2 = High Assessment (External)", ylab="Blood Pressure")
boxplot(medical$bp~medical$final, xlab="1 = Not Immediate (Final)  2 = Immediate (Final)", ylab="Blood Pressure")

# Plot histograms
hist(medical$freq, main="Frequency")
hist(medical$bp, main="Blood Pressure")
hist(medical$first, main="Internal Assessment", xlab="1 - Bad    2 - Good")
hist(medical$second, main="External Assessment", xlab="1 - Bad    2 - Good")
hist(medical$final, main="Final Assessment", xlab="1 - Not Immediate    2 - Immediate")
