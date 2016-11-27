################## FEATURE SELECTION USING BORUTA #############################################

library(Boruta)

# Decide if a variable is important or not using Boruta
# perform Boruta search#

boruta_output <- Boruta(ozone_reading ~ ., data=na.omit(inputData), doTrace=2)

# collect Confirmed and Tentative variables

boruta_signif <- names(boruta_output$finalDecision[boruta_output$finalDecision %in% c("Confirmed", "Tentative")])  

# significant variables#

print(boruta_signif)  

plot(boruta_output, cex.axis=.7, las=2, xlab="", main="Variable Importance")

###############################################################################################