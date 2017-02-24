frequency_Generator <- function(train){
  k=1
  j=0
  Frequency_table<- as.data.frame(matrix(data = NA, ncol = 3))
  colnames(Frequency_table) <- c('Variable_Name','Category_Name','Frequency')
  for(i in 1:ncol(train))
  {
    Frequency_table[k:(k+NROW(table(train[,i]))-1),1]<-names(train)[i]
    Frequency_table[k:(k+NROW(table(train[,i]))-1),3]<-table(train[,i])
    Frequency_table[k:(k+NROW(table(train[,i]))-1),2]<-levels(train[,i])
    j<-NROW(table(train[,i]))
    k=k+j
  }
  Frequency_table <- as.data.frame(Frequency_table)
}
