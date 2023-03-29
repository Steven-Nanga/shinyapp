#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(leaflet)

ui <- fluidPage(
  titlePanel("Location Map"),
  sidebarLayout(
    sidebarPanel(
      textInput("latitude", "Enter Latitude"),
      textInput("longitude", "Enter Longitude"),
      actionButton("submit", "Submit")
    ),
    mainPanel(
      leafletOutput("map")
    )
  )
)

server <- function(input, output) {
  
  location <- eventReactive(input$submit, {
    c(input$longitude, input$latitude)
  })
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = as.numeric(location()[1]), lat = as.numeric(location()[2]), zoom = 15) %>%
      addMarkers(lng = as.numeric(location()[1]), lat = as.numeric(location()[2]), popup = "Location")
  })
  
}

shinyApp(ui = ui, server = server)
