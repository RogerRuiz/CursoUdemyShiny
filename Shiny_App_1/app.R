library(shiny)

#Preprocesado de los datos

mpgData    <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automático", "Manual"))

#Interfaz de usuario

ui <- pageWithSidebar(

  #Título de la App
  headerPanel("Millas por Galón"),

  #Creamos un sidebar panel para las entradas
  sidebarPanel(
    
    #Input 1: Selector de la variable a visualizar frente a mpg (Millas por Galón)
    selectInput("var", "Variable:",
                choices = c("Cilindros"   = "cyl",
                            "Transmisión" = "am",
                            "Motores"     = "gear")
                ),
    
    #Input 2: Checkbox para si deben ser incluidos los outliers
    checkboxInput("outliers", "Mostrar los outliers", TRUE)
    
  ),

  #El mainPanel visualizará los resultados (salidas)
  mainPanel(
    
    #Output 1: Texto
    h3(textOutput("texto")),
    
    #Output 2: Plot
    plotOutput("mpgPlot")
    
    
  )

)

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

#Lanzamiento de la App

shinyApp(ui = ui, server = server)