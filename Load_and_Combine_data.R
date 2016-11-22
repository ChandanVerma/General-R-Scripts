## Clearing the R Environment
rm(list = ls())

## Setting the path
path <- "D:\\Projects\\AllState"
setwd(path)

## Loading required libraries
library(caret)
library(plyr)
library(data.table)

## Set Parallel Processing - Decrease computation time

library(doMC)
registerDoMC(cores = 5)

##Loading the data


train <- as.data.frame(fread("train.csv")) 
test<- as.data.frame(fread("test.csv"))


## If data has blank values and we want it to be NA

train <- as.data.frame(fread("train.csv",na.strings=c("", "NA")))
test<- as.data.frame(fread("test.csv",na.strings=c("", "NA")))

## Specify the target variable

target <- 'loss'

##Filling the target column in the test set

test$loss<- "NA"

## Combining the test and train set

combined <- rbind(train, test)