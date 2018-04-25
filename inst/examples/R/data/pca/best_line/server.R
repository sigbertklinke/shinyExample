library("shiny")

index <- sample(nrow(faithful), 30)
zx    <- scale(faithful$eruptions)
zy    <- scale(faithful$waiting)
xlim  <- range(zx)
ylim  <- range(zy)

makeTable <- function(tab) {
  ret <- ''
  if (length(tab)) {
    cmp     <- (names(tab)=="")
    nonames <- is.na(cmp) | cmp
    names   <- ifelse(nonames, '', paste0('<tr><td bgcolor="#CCCCCC">', names(tab), '</td></tr>'))
    values  <- paste0('<tr><td align="right">', tab, '</td></tr>')
    ret     <- paste0('<table width="100%">', paste0(names, values, collapse=''), '</table>')
  }
  ret
}

shinyServer(function(input, output, session) {
  
  values <- reactiveValues(table=c())
  
  output$outputPlot <- renderPlot({
    plot(zx[index], zy[index], pch=19, asp=1, xlim=xlim, ylim=ylim,
         main="Subsample of Old Faithful geyser data", xlab="Eruption time (standardized)", ylab="Waiting time (standardized)")
    usr   <- par('usr')
    dy    <- sin(pi*input$angle/180)
    dx    <- cos(pi*input$angle/180)
    t0    <- max(min(usr[3:4]/dy), min(usr[1:2]/dx)) 
    t1    <- min(max(usr[3:4]/dy), max(usr[1:2]/dx)) 
    lines(dx*c(t0,t1),dy*c(t0,t1), col="blue")
    t     <- zx[index]*dx+zy[index]*dy
    points(dx*t, dy*t, pch=19, cex=0.75, col="blue")
    error <- 0
    for (i in seq(index)) {
      lines(c(dx*t[i], zx[index[i]]), c(dy*t[i], zy[index[i]]), col="lightblue")
      error <- error + sqrt((dx*t[i]-zx[index[i]])*(dx*t[i]-zx[index[i]])+(dy*t[i]-zy[index[i]])*(dy*t[i]-zy[index[i]]))
    }
    tab <- c(sprintf("%.2f", error))
    names(tab) <- c("Total distance")
    values$table <- tab
    })
  
  output$outputValues <- renderText({
    makeTable(values$table)
  })

})