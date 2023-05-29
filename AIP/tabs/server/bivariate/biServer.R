# install.packages('spatstat')
library(spatstat)
# swedishpines   (one group)

################################################################################
output$plot <- renderPlot({
  radius <- input$radius
  
  # # Create dummy data
  # x = swedishpines$x
  # y = swedishpines$y
  # plot(x,y)
  # w = owin(c(0,96), c(0,99))
  # X1 = ppp(x, y, window=w)    # "ppp" object: 71 observed points
  # 
  #   par(mfrow = c(1, 2),
  #       mai = c(0, 0, 0.5, 1))
  #   # AIP
  #   uniAIP(x, y, radius)
  #   # spatstat
  #   fit = ppm(X1, trend=~1, interaction=AreaInter(radius))
  #   modelFitted<-rmh(fit)
  #   modelFitted$marks = rep(2*radius, modelFitted$n)
  #   plot(modelFitted, markscale=1, legend=FALSE, bty="n", main="spatstat", 
  #        show.window=FALSE, cols="red")
  #   points(modelFitted, pch=20)
})





