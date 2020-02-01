Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC <- c(4, 62, 51, 21, 2, 14, 15)
CBS <- c(12, 75, 43, 19, 1, 21, 19) 
election <- data.frame(Name, ABC, CBS, stringsAsFactors=F)
election

#      Name ABC CBS
# 1     Jeb   4  12
# 2  Donald  62  75
# 3     Ted  51  43
# 4   Marco  21  19
# 5   Carly   2   1
# 6 Hillary  14  21
# 7  Bernie  15  19

election <- election[order(ABC,CBS),]
election

#      Name ABC CBS
# 5   Carly   2   1
# 1     Jeb   4  12
# 6 Hillary  14  21
# 7  Bernie  15  19
# 4   Marco  21  19
# 3     Ted  51  43
# 2  Donald  62  75

library(ggplot2)
ggplot(election, aes(x=Name, y=ABC, fill=Name)) +
  geom_bar(stat="identity", position="dodge")
ggplot(election, aes(x=Name, y=CBS, fill=Name)) +
  geom_bar(stat="identity", position="dodge")
