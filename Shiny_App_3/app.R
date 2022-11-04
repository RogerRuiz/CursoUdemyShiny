library(shiny)

ui <- fluidPage(
  
  titlePanel("¡Hola Shiny!"),
  
  sidebarLayout(
    
    sidebarPanel(
      h5("Panel Literal"),
      width = 4,
      sliderInput(inputId = "contenedores",
                  label   = "Número de contenedores",
                  min     = 1,
                  max     = 60,
                  value   = 30 )
    ),
    
    mainPanel(
      h5("Panel Principal"),
      plotOutput(outputId = "plot")
    )
    
  )
  
)

server <- function(input, output){
  
  output$plot <- renderPlot(
    {
      x <- faithful$waiting
      contenedores <- seq(min(x), max(x), length.out = input$contenedores + 1)
      hist(
        x,
        breaks = contenedores,
        col    = "#75AADB",
        border = "white",
        xlab   = "Tiempo de espera entre erupciones (en minutos)",
        main   = "Histograma del tiempo de espera"
      )
    }
  )
  
}

shinyApp(ui = ui, server = server)