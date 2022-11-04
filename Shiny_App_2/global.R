library(shiny)

#Preprocesado de los datos

mpgData    <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automático", "Manual"))
mpgData$am <- factor(mpgData$am, labels = c("Automático", "Manual"))