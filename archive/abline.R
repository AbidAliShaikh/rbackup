
temp.cut <- equal.count(environmental$temperature,4)

xyplot(ozone, radiation | temp.cut, data = environmental
       panel = function(x,y,...) {
         panel.xyplot(x,y,...)
         dit <- lm(y ~ x)
         panel.abline(dit)
         
       })


plot (0,0, main = expression (mu ==0), ylab = expression(hat(gamma) == 0), xlab = expression (sum(x[i] * y[i],i=1,n)))