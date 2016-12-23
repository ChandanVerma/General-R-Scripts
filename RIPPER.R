rm(list = ls())
mushrooms <- read.csv('mushrooms.csv', stringsAsFactors = T)
str(mushrooms)

mushrooms$veil_type<- NULL

install.packages('RWeka')
library(RWeka)

mushroom_1R <- OneR(type ~., data = mushrooms)

summary(mushroom_1R)

mushrooms_Jrip <- JRip(type~., data = mushrooms)

summary((mushrooms_Jrip))
