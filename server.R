source("helpers.R")

shinyServer(
    function(input, output) {
        output$tekst <- renderTable({
            input$arvuta#arvuta nupule vajutades arvutab
            
            isolate(kp <- switch(input$kp, 
                         "1"= 0.02,
                         "2" = 0.03,
                         "3" = 0))
            
            #isolate on vaja, et arvutaks siis kui vajuta nupule on vajutatud
           isolate(palk(palk=input$palk, liik=input$liik,
                             tm.vaba=input$tm.vaba, tm.maar=0.2, sm.maar=0.33, 
                             kp.maar=kp, tk.maar.tootaja=input$tk.tootaja, 
                 tk.maar.tooandja=input$tk.tooandja))
        })
    }
)
