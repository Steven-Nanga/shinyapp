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
