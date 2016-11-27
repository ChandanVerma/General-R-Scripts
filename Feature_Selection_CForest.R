############ Feature Selection using RANDOM FOREST METHOD ############################

library(party)
# fit the random forest
cf1 <- cforest(target ~ . , data= X_train, control=cforest_unbiased(mtry=2,ntree=50)) 
# get variable importance, based on mean decrease in accuracy#=>                 
varimp(cf1) 
# conditional=True, adjusts for correlations between predictors#=>
varimp(cf1, conditional=TRUE)
# more robust towards class imbalance.#=>
varimpAUC(cf1)

######################################################################################