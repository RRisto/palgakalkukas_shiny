
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)


shinyUI(fluidPage(
    titlePanel("Palgakalkulaator"),
    
    sidebarLayout(
        sidebarPanel(
            numericInput("palk", label = h3("Palk:"), value = 500),
            
            selectInput("liik", label = h3("Vali palgaliik"), 
                        choices = list("Brutopalk"="bruto", "Netopalk"="neto"), 
                        selected = "Netopalk"),
            
            selectInput("kp", label = h3("Kogumispension"), 
                        choices = list("Olen liitunud (2%)"="1",
                                       "Olen esitanud tõstmise avalduse (3%)"="2", 
                                       "Ei ole liitunud (0%)"="3"), 
                        selected = "1"),
            
            checkboxInput("tm.vaba", label="Tulumaksuvaba miinimum (154€ kuus)",
                          value = TRUE),
            checkboxInput("tk.tootaja", label="Töötaja töötuskindlustusmakse (1.6 %)",
                          value = TRUE),
            checkboxInput("tk.tooandja", label="Tööandja töötuskindlustusmakse (0.8 %)",
                          value = TRUE),
            actionButton("arvuta", label = "Arvuta")
        ),
        
        mainPanel(tableOutput("tekst"))
    )
))
