library(shiny)
library(shinyFiles)
library(shinyalert)

ui <- fluidPage(
  useShinyalert(),  # Include shinyalert
  titlePanel("Directory Selection Example"),
  sidebarLayout(
    sidebarPanel(
      shinyDirButton("directory", "Choose Directory", "Please select a directory"),
      verbatimTextOutput("dir"),
      actionButton("start", "RUN")
    ),
    mainPanel(
      textOutput("status")
    )
  )
)

library(shiny)
library(shinyFiles)
library(readr)
library(DT)

server <- function(input, output, session) {
  # Define roots for shinyFiles
  roots <- c(
    home = normalizePath("~"),
    desktop = normalizePath("~/Desktop")
  )
  
  if (.Platform$OS.type == "windows") {
    roots <- c(roots, windows_desktop = normalizePath("~\\Desktop"))
  }
  
  shinyDirChoose(input, "directory", roots = roots, session = session)
  
  # Reactive value to store directory path
  dir_path <- reactive({
    req(input$directory)
    selected_dir <- parseDirPath(roots, input$directory)
    normalizePath(selected_dir, winslash = "/")
  })
  
  # Display chosen directory
  output$dir <- renderText({
    req(dir_path())
    dir_path()
  })
  
  # Status output
  output$status <- renderText({
    "System is idle"
  })
  
  # When RUN button is clicked
  observeEvent(input$start, {
    req(dir_path())
    selected_dir <- dir_path()
    
    # Log the selected directory for debugging
    cat("Selected directory:", selected_dir, "\n")
    
    # Check if the directory exists
    if (!dir.exists(selected_dir)) {
      shinyalert("Error", "Directory does not exist.", type = "error")
      output$status <- renderText({
        "Directory does not exist."
      })
    } else {
      shinyalert("Success", "Directory exists and is accessible!", type = "success")
      output$status <- renderText({
        paste("Directory selected:", selected_dir)
      })
    }
  })
}

shinyApp(ui, server)

