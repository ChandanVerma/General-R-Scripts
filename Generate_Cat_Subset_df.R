Categorical_df <- function(train){
  
  cat_df<- as.data.frame(matrix(data = NA, ncol =ncol(train), nrow = NROW(train)))
  colnames(cat_df)<- colnames(train)
  for(i in 1:ncol(train))
  {
    if(class(train[,i])=='factor')
    {
      cat_df[,i]<- train[,i]
    }
    
  }
  catdf1<-cat_df[colSums(!is.na(cat_df)) > 0]
}