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
    par(mfrow=c(1,2))
    zmax  <- max(sqrt(zx*zx+zy*zy))
    plot(zx[index], zy[index], pch=19, asp=1, xlim=xlim, ylim=ylim,
         main="Subsample of Old\nFaithful geyser data", xlab="Eruption time (standardized)", ylab="Waiting time (standardized)")
    usr   <- par('usr')
    
    dy    <- sin(pi*input$angle/180)
    dx    <- cos(pi*input$angle/180)
    t0    <- max(min(usr[3:4]/dy), min(usr[1:2]/dx)) 
    t1    <- min(max(usr[3:4]/dy), max(usr[1:2]/dx)) 
    lines(dx*c(t0,t1),dy*c(t0,t1), col="blue")
    tx     <- zx[index]*dx+zy[index]*dy
    points(dx*tx, dy*tx, pch=19, cex=0.75, col="blue")

    dy    <- sin(pi*(input$angle+90)/180)
    dx    <- cos(pi*(input$angle+90)/180)
    t0    <- max(min(usr[3:4]/dy), min(usr[1:2]/dx)) 
    t1    <- min(max(usr[3:4]/dy), max(usr[1:2]/dx)) 
    lines(dx*c(t0,t1),dy*c(t0,t1), col="green")
    ty     <- zx[index]*dx+zy[index]*dy
    points(dx*ty, dy*ty, pch=19, cex=0.75, col="green")    

    plot(tx, ty, pch=19, xlab="Blue", ylab="Green", main="Projected data points", asp=1,
        xlim=c(-zmax, zmax), ylim=c(-zmax, zmax))
    rug(tx, side=1, col="blue")
    rug(ty, side=2, col="green")

    tab <- c(sprintf("%.2f", var(tx)), sprintf("%.0f%%", 100*var(tx)/(var(zx[index])+var(zy[index]))),
             sprintf("%.2f", var(ty)), sprintf("%.0f%%", 100*var(ty)/(var(zx[index])+var(zy[index]))))
    names(tab) <- c("Variance of projected data points (blue)", "Explained total variance (blue)",
                    "Variance of projected data points (green)", "Explained total variance (green)")
    values$table <- tab
    })
  
    output$outputValues <- renderText({
      makeTable(values$table)
    })
    

})