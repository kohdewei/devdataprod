library(shiny) 

getFitness<-function(age, gender, bpm) {
  # fitness data from http://www.topendsports.com/testing/heart-rate-resting-chart.htm
  ageCategory <- c(18,26,36,46,56,65)
  bpmMaleCategory <- data.frame(b1=c(49,56,62,66,70,74,82),b2=c(49,55,62,66,71,75,82),b3=c(50,57,63,67,71,76,83),b4=c(50,58,64,68,72,77,84),b5=c(51,57,62,68,72,76,82),b6=c(50,56,62,66,70,74,80))
  bpmFemaleCategory <- data.frame(b1=c(54,61,66,70,74,79,85),b2=c(54,60,65,69,73,77,83),b3=c(54,60,65,70,74,79,85),b4=c(54,61,66,70,74,78,84),b5=c(54,60,65,69,74,78,84),b6=c(54,60,65,69,73,77,84))
  fitnessCategory <- c("Athelete","Excellent","Good","Above Average","Average","Below Average","Poor")
  
  # obtains fitness category
  ageIndex <- max(which(ageCategory<=age))
  if (gender=="Male") fitnessCategory[max(which(bpmMaleCategory[ageIndex]<=bpm))]
  else fitnessCategory[max(which(bpmFemaleCategory[ageIndex]<=bpm))]
}

shinyServer(
  function(input, output) {
    output$inputAge <- renderPrint({input$age})
    output$inputGender <- renderPrint({input$gender})
    output$inputBPM <- renderPrint({input$bpm})
    output$fitness <- renderPrint({getFitness(input$age, input$gender, input$bpm)})
  }
)