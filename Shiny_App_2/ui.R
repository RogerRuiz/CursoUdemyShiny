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