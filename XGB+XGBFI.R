library(caTools)
trainTransformed <- as.data.frame(trainTransformed)
trainTransformed$y <- exp(train_y)

split <- sample.split(trainTransformed$y , SplitRatio = 0.7)
Dtrain <- subset(trainTransformed, split == T)
Dtest <- subset(trainTransformed, split ==F)
Dtrain_y <- Dtrain$y
Dtest_y <- Dtest$y
Dtrain$y <- NULL
Dtest$y <- NULL

Dtrain <- as.matrix(Dtrain)
Dtest <- as.matrix(Dtest)

trainTransformed$y <- NULL
trainTransformed <- as.matrix(trainTransformed)

cv <- xgb.cv(data = trainTransformed, label = train_y, nrounds = 2000, nfold = 5, metrics = "rmse",
             max_depth = 15, eta = 0.1, objective = "reg:linear")

bst <- xgboost(data = trainTransformed, label = train_y, max_depth = 4,
               eta = 1, nthread = 2, nrounds = 1000,objective = "reg:linear")

importance <- xgb.importance(feature_names = colnames(trainTransformed), model = bst)
head(importance)


xgb.plot.importance(importance_matrix = importance, top = 25)

featureList <- names(trainTransformed[,-1])
featureVector <- c() 
for (i in 1:length(featureList)) { 
  featureVector[i] <- paste(i-1, featureList[i], "q", sep="\t") 
}
write.table(featureVector, "fmap.txt", row.names=FALSE, quote = FALSE, col.names = T)
xgb.dump(model = bst, fname = 'xgb.dump', fmap = "fmap.txt", with.stats = TRUE)

pred <- predict(bst, newdata = test_mat)

submission <- read.csv('sample_submission.csv')
submission$y <- exp(pred)

fwrite(submission,'submission.csv')






