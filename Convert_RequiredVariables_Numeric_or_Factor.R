## Converting all the required variable to factor variable 

@@ combined is your data frame name which in your case needs to be replaced by your data frame name
@@ 2:117 is the columns that you want to convert to factor

names<- c(2:117)
combined[,names]<- lapply(combined[,names], factor)

## Converting all the required variable to numeric variable 

names<- c(2:117)
combined[,names]<- lapply(combined[,names], as.numeric)
