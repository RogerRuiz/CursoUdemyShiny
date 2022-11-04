#Lógica de la parte del servidor

server <- function(input, output, session){
  
  #Calcular el texto de la fórmula
  #Es una fórmula reactiva que generará la variable de salida output$texto
  
  formulaTexto <- reactive({
    paste("mpg ~", input$var)
  })
  
  output$texto <- renderText({
    formulaTexto()
  })
  
  #Generamos el Plot con la variable de salida output$mpgPlot
  
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaTexto()),
            data = mpgData,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
  
  
}