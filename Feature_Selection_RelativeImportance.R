################### FEATURE SELECTION USING RELATIVE IMPORTANCE ######################

install.packages('relaimpo')

library(relaimpo)

# fit lm() model

lmMod <- lm(LENGTH_OF_STAY ~ . , data = df1[,-1])  

# calculate relative importance scaled to 100

relImportance <- calc.relimp(lmMod, type = "lmg", rela = TRUE)  

# relative importance#=>

sort(relImportance$lmg, decreasing=TRUE)  

######################################################################################