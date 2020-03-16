############################################################################
# ------ ------ --- ------ MOD9: Visualization in R ------ --- ------ ------ 
############################################################################
#' ---
#' title:   "MOD9: Visualization in R"
#' author:  "Kevin Hitt"
#' date:    "Due: March 16th, 2020"
#' ---

# Import packages
library(ggplot2)
library(lattice)

# Import data
# Credit: https://vincentarelbundock.github.io/Rdatasets/datasets.html
#         "Full Leaf Shape Data Set"
leaf <- read.csv("leafshape.csv")

# Investigate data
str(leaf)
head(leaf)

# Basic R plots
par(mfrow = c(2,2))
plot(bladelen ~ bladewid, leaf, type = "p", 
     col="darkgreen", pch = 2, cex = petiole/10,
     main = "Width v Length", ylab = "Length", xlab = "Width")
plot(petiole ~ bladewid, leaf, type = "p", 
     col="darkgreen", pch = 2, cex = petiole/10, 
     main = "Width v Petiole", ylab = "Petiole", xlab = "Width")
plot(latitude ~ bladewid, leaf, type = "p", 
     col="darkgreen", pch = 2, cex = petiole/10, 
     main = "Width v Latitude", ylab = "Latitude", xlab = "Width")
#dev.off()

# lattice plot
xyplot(bladelen ~ bladewid | location, leaf, 
       grid=T,
       type = c("p", "smooth"), 
       lwd = 3,
       group=arch,
       auto.key = T,
       main = "Blade Width v Blade Length (Fill = Arch)")

hexbinplot(bladelen ~ bladewid | location, leaf,
           grid=T,
           main = "Blade Width v Blade Length")

# ggplot2 plots
ggplot(leaf, aes(x=bladewid)) +
  geom_histogram(binwidth=0.2, color="black", fill="steelblue", aes(y=..density..)) +
  geom_density(stat="density", alpha=I(0.2), fill="blue") +
  xlab("Blade Width") +  ylab("Density") + ggtitle("Histogram & Density Curve")

ggplot(leaf, aes(x=bladewid, y=bladelen, color=location)) + 
  geom_point() +
  geom_smooth(se=FALSE) +
  theme_minimal() +
  ggtitle("Blade Width v Blade Length (with smoothing)")

