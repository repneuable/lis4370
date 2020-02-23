##################################################
# ------------LIS_4317-M6_Assignment---------- #
##################################################
#' ---
#' title: "CTPE Revenue"
#' author: "Kevin Hitt"
#' date: "February 22nd, 2020"
#' ---

# Create your first basic graphic in R as I outlined in 
# the video and power point

# I chose this topic becuase of three reasons 
#   (1) I already have extensive domain knowledge
#     of the data and have never used R to analyze it
#   (2) the assignment directions seemed flexible 
#     enough to explore a topic I have been thinking 
#     about recently, and 
#   (3) it is real world data that I have helped collect
#
# Data is from the USF Office of Corporate Training 
# and Professional Education registration system

#Add packages
library(readxl)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(lubridate)
library(RColorBrewer)

#Import data
ctpe <- read.csv("rev.csv", header=T)

#Assign column names
names(ctpe) <- c("courseid","catid","catname","catcreated",
                 "currency", "discount", "enr_completion", 
                 "status","orderid","tnid", "credits", 
                 "listingid","title", "orderid2", "price",
                 "paid","promo","purchasedat","email",
                 "userid","name") 

#Remove invalid rows from testing phase of software implementation
ctpe <- ctpe[-c(1:19),]

#Group categories manually for easier comparison
# (multiple grepl expressions were used instead of a single
#  command with multiple conditionals to avoid errors when
#  plotting.)
ctpe$cat <- ifelse(grepl("Review", ctpe$catname), 
                   "Test Prep", as.character(ctpe$catname))
ctpe$cat <- ifelse(grepl("Human", ctpe$catname), 
                   "HR", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("SHRM", ctpe$catname), 
                   "HR", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("Career", ctpe$catname), 
                   "HR", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("5G", ctpe$catname), 
                   "HR", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("Organization", ctpe$catname), 
                   "HR", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("Hospitality", ctpe$catname), 
                   "Hospitality", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("PMP", ctpe$catname), 
                   "Project Management", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("Project", ctpe$catname), 
                   "Project Management", as.character(ctpe$cat))
ctpe$cat <- ifelse(grepl("Corporate", ctpe$catname), 
                   "Leadership", as.character(ctpe$cat))

#Get days of week for later compairson
ctpe$weekday <- weekdays(as.POSIXct(ctpe$catcreated), abbreviate = F)

#Add factor to weekdays for a logically ordered x-axis
ctpe <- ctpe %>% 
  mutate(weekday = factor(weekday, 
                          levels = c("Monday", "Tuesday", 
                                     "Wednesday", "Thursday", 
                                     "Friday", "Saturday", "Sunday")))

#Separate refunds from actual transactions
ctpe_a <- ctpe[ctpe$status=="active",]

#Remove customer service adjustments of $0
ctpe_a <- ctpe_a %>%
  filter(paid!=0)

#Visualize
ggplot(ctpe_a, aes(x=weekday, y=paid, fill=cat)) + 
  geom_bar(stat="identity") + 
  #  theme_tufte() +
  theme_calc() +  
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_fill_brewer(palette="Set1") +
  labs(title = "Total Payments by Day of the Week (April 2019 - January 2020)", 
       x = "Weekday", y = "Total Dollar Amount Paid", fill = "Course Category")
