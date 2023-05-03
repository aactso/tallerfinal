
library(shiny)
library(ggplot2)
library(tidyr)
library(dplyr)

datos3<-read.csv("/Users/alecortes/Desktop/practica final Taller/fake.csv")
getwd()
datos2<-datos3%>%
  select(x_age,x_income_num,x_education_num)

ui <- fluidPage(
  titlePanel("¿Por qué son importantes las covariables?"),
  sidebarLayout(
    sidebarPanel(
      selectInput("columna", "Selecciona una columna:",
                  choices = names(datos2), selected = names(datos2)[1])
    ),
    mainPanel(
      plotOutput("grafico"),
      h4("En Believing and Sharing Information by Fake Sources: An Experiment de Bauer y Clemm von Hohenberg (2020) se tomaron en cuenta
         tres covariables relevantes: la edad, el ingreso y la educación para llevar a cabo un análisis respecto a la interacción que
         tienen las personas con las fake news y si las comparten en distintas redes sociales y qué tan suceptibles son a creer en las fake news."),
      h5("Con base en artículos recientes se sabe que la edad es un factor relevante frente a la publicación de noticias, ya que la gente
         joven reaccióna distinto a los adultos mayores y se impresionan menos ante noticias convencionales. A su vez, diversos estudios sugieren
         que el ingreso y la educación están correlacionados con la capacidad de distinguir entre noticias falsas y verdaderas.  
         Así, con estos gráficos de barras podemos analizar las principales covariables del estudio para demostrar el impacto que tienen sobre compartir
         noticias en redes sociales o confiar en la veracidad de la noticia frente a una falsa o verdadera de una fuente real y una fuente falsa.")
    )
  )
)


server <- function(input, output) {
  output$grafico <- renderPlot({
    ggplot(datos2, aes(x = datos2[, input$columna])) + 
      xlab("Valores")+
      geom_bar(color="black", fill="#000080")
  })
}

shinyApp(ui = ui, server = server)

