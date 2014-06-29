colorfun <-
function (x) 
roundcolor(convertColor(cbind(palette[[1L]](x), palette[[2L]](x), 
    palette[[3L]](x)), from = "Lab", to = "sRGB")) * 255
