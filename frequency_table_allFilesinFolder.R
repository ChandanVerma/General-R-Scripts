path <-'//Nileshb3-msl1/ucb/Fact Files_F'
setwd(path)
filenames <- list.files("//Nileshb3-msl1/ucb/Fact Files_F")
ldf <- lapply(filenames, readRDS)
k=1
j=0
Frequency_table <- as.data.frame(matrix(data = NA, ncol = 4))
names(Frequency_table)[1:4]<- c('File_Name','Variable_Name','Category_Name','Frequency')
for(l in 1:length(ldf))
{
  for(i in 1:ncol(ldf[[l]]))
  {
  Frequency_table[k:(k+NROW(table(ldf[[l]][,i]))-1),1] <- filenames[l]
  Frequency_table[k:(k+NROW(table(ldf[[l]][,i]))-1),2] <- names(ldf[[l]])[i]
  Frequency_table[k:(k+NROW(table(ldf[[l]][,i]))-1),3] <- levels(ldf[[l]][,i])
  Frequency_table[k:(k+NROW(table(ldf[[l]][,i]))-1),4] <- table(ldf[[l]][,i])
  j<-NROW(table(ldf[[l]][,i]))
  k=k+j
  }
}
