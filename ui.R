library(shiny) 
shinyUI(
  pageWithSidebar(
    headerPanel("Fitness Calculator"),
    
    sidebarPanel(
      numericInput('age', 'Age', 40, 18, 100, 1) ,
      selectInput('gender', 'Gender', c("Male", "Female")) ,
      numericInput('bpm', 'Resting heart rate (Beats Per Minute)', 70, 49, 100, 1),
      submitButton('Submit')
    ), 
    mainPanel(
      p('Your resting heart rate, together with your age and gender, gives an indication of your fitness and health.  The basic fitness indicators are obtained from http://www.topendsports.com/testing/heart-rate-resting-chart.htm.'),
      p('The fitness categories available are:'),
      tags$div(
        tags$ul(
          tags$li('Athlete'),
          tags$li('Excellent'),
          tags$li('Good'),
          tags$li('Above Average'),
          tags$li('Average'),
          tags$li('Below Average'),
          tags$li('Poor')
        )
      ),
      
      h4('Based on the following inputs:'), 
      p('Age:'), verbatimTextOutput("inputAge"),
      p('Gender:'), verbatimTextOutput("inputGender"),
      p('Resting heart rate (Beats Per Minute):'), verbatimTextOutput("inputBPM"),
      h4('Your Fitness Category is:'),
      verbatimTextOutput("fitness")
    )
  )   
)