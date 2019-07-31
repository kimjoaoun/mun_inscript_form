#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(readr)
library(googlesheets4)


# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("Inscrição MyMUN"),

  # Sidebar with a slider input for number of bins


  # Show a plot of the generated distribution
  tabsetPanel(
    type = "tabs",
    tabPanel(
      "Inscrição",
      hr(),
      selectInput("delenum", "Número de Delegados", c(1, 2, 3, 4, 5, 6)),
      hr(),
      ##### Paineis Condicionais#####

      ###### UM DELEGADO#####
      conditionalPanel(
        condition = "input.delenum == 1",
        textInput("nome", "Nome Completo"),
        dateInput("nasc", "Data de Nascimento", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end", "Endereço"),
        textInput("tel", "Telefone"),
        selectInput("comit", "Comitê", c(
          "UNESCO" = "UNESCO",
          "Conf. do Acordo de Belfast" = "CHAB",
          "ACNUR - Refugiados LGBT+" = "ACNUR",
          "CARANA" = "CAR"
        )),
        selectInput("dele", "Delegação", c("Estados Unidos" = "EUA", "Canadá"))
      ),

      ##### DOIS DELEGADOS#####
      conditionalPanel(
        condition = "input.delenum == 2",
        textInput("nome1", "Nome Completo - Chefe de Delegação"),
        dateInput("nasc1", "Data de Nascimento 1", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end1", "Endereço 1"),
        textInput("tel1", "Telefone 1"),
        hr(),
        textInput("nome2", "Nome Completo 2"),
        dateInput("nasc2", "Data de Nascimento 2", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end2", "Endereço 2"),
        textInput("tel2", "Telefone 2"),
        selectInput("comit", "Comitê", c(
          "UNESCO" = "UNESCO",
          "Conf. do Acordo de Belfast" = "CHAB",
          "ACNUR - Refugiados LGBT+" = "ACNUR",
          "CARANA" = "CAR"
        )),
        selectInput("dele", "Delegação", c("Estados Unidos" = "EUA", "Canadá"))
      ),
      ##### TRES DELEGADOS#####
      conditionalPanel(
        condition = "input.delenum == 3",

        textInput("nome1", "Nome Completo - Chefe de Delegação"),
        dateInput("nasc1", "Data de Nascimento 1", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end1", "Endereço 1"),
        textInput("tel1", "Telefone 1"),
        hr(),
        textInput("nome2", "Nome Completo 2"),
        dateInput("nasc2", "Data de Nascimento 2", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end2", "Endereço 2"),
        textInput("tel2", "Telefone 2"),
        hr(),
        textInput("nome3", "Nome Completo 3"),
        dateInput("nasc3", "Data de Nascimento 3", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end3", "Endereço 3"),
        textInput("tel3", "Telefone 3"),
        selectInput("comit", "Comitê", c(
          "UNESCO" = "UNESCO",
          "Conf. do Acordo de Belfast" = "CHAB",
          "ACNUR - Refugiados LGBT+" = "ACNUR",
          "CARANA" = "CAR"
        )),
        selectInput("dele", "Delegação", c("Estados Unidos" = "EUA", "Canadá"))
      ),

      ##### QUATRO DELEGADOS#####
      conditionalPanel(
        condition = "input.delnum == 4",
        textInput("nome1", "Nome Completo - 1 - Chefe de Delegação"),
        dateInput("nasc1", "Data de Nascimento 1", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end1", "Endereço 1"),
        textInput("tel1", "Telefone 1"),
        hr(),
        textInput("nome2", "Nome Completo - 2"),
        dateInput("nasc2", "Data de Nascimento 2", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end2", "Endereço 2"),
        textInput("tel2", "Telefone 2"),
        hr(),
        textInput("nome3", "Nome Completo - 3"),
        dateInput("nasc3", "Data de Nascimento 3", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end3", "Endereço 3"),
        textInput("tel3", "Telefone 3"),
        hr(),
        textInput("nome4", "Nome Completo - 4"),
        dateInput("nasc4", "Data de Nascimento 4", format = "dd-mm-yyyy", language = "pt-BR"),
        textInput("end4", "Endereço 4"),
        textInput("tel4", "Telefone 4")
      )
    )
  ),


  actionButton("send", "Enviar Inscrição")
)
# Define server logic required to draw a histogram
server <- function(input, output) {
    
  output$botao1del <- eventReactive(input$send, {
    n <- input$nome
    nasc <- input$nasc
    endereco <- input$end
    telefone <- input$tel
    comite <- input$comit

    # LOCALIZAÇÃO DO CSV DA INSCRIÇÃO | TRUE = Armazenamento GSheets; FALSE = Armazenamento no Local
    data.on.gs <- TRUE
    local <- ""

    if (data.on.gs == TRUE) {
      t <- read_csv()
    } else {
      t <- read_csv(local)
    }

    t <- tibble::tibble(n, nasc, endereco, telefone, comite)
    t <- dplyr::bind_rows(t, k)
    
  })
}

# Run the application
shinyApp(ui = ui, server = server)
