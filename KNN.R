wbcd<- read.csv('wisc_bc_data.csv', stringsAsFactors = F)
str(wbcd)

wbcd<- wbcd[-1]
table(wbcd$diagnosis)

wbcd$diagnosis<- factor(wbcd$diagnosis, levels = c('B','M'),
                        labels = c('Benign','Malignant'))

round(prop.table(table(wbcd$diagnosis))*100, digits = 1)

summary(wbcd)

#### Min-Max Normalization

normalize <- function(x){
  return((x-min(x))/(max(x)- min(x)))
}



wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

wbcd_train<- wbcd_n[1:469,]
wbcd_test<- wbcd_n[470:569,]

wbcd_train_labels <- wbcd[1:469,1]
wbcd_test_labels <- wbcd[470:569,1]

install.packages('class')
library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl= wbcd_train_labels, k = 21)

library(gmodels)

CrossTable(wbcd_test_labels,wbcd_test_pred, prop.chisq = F )

#-------------------------------------------------------------
 
### Z-Score Standardization

wbcd_z<- as.data.frame(scale(wbcd[-1]))

wbcd_train<- wbcd_z[1:469,]
wbcd_test <- wbcd_z[470:569,]
 

wbcd_train_labels <- wbcd[1:469,1]
wbcd_test_labels <- wbcd[470:569,1]

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl= wbcd_train_labels, k = 21)

CrossTable(wbcd_test_labels,wbcd_test_pred, prop.chisq = F )
