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
