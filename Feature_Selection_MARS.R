############### FEATURE SELECTION USING MARS #######################################

library(earth)

# build model

marsModel <- earth(LENGTH_OF_STAY ~ ., data=df1[,c(-1,-2)]) 

# estimate variable importance#=>

ev <- evimp (marsModel)                        

plot(ev)

####################################################################################