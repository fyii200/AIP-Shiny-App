

# Point-pattern analysis
# Mike Allerhand, October 2022


#################################################################################################################




#################################################################################################################
# Functions

# Functions areaLoss and areaGain both calculate disc area that is NOT overlapped.
#   areaLoss(X1, r)      returns area of each disc in set X1 that is not overlapped by any other disc in X1.
#   areaGain(X1, X2, r)  returns area of each disc in set X1 that is not overlapped by any disc in X2.

# Intra-group area interaction, the proportion of each disc's area that is overlapped.
# Scale so each disc's total area is 1, and subtract from 1 to obtain the proportion overlapped.
#   X1     Observed ppp
#   X2     Dummy ppp
#   r      Disc radius
#   w      Window


# uniAIP



#################################################################################################################

uniAIP <- function(x,y,R){
  
  intra.group = function(X1, X2, r, w) {
    obs = areaLoss(X1, r)
    dum = areaGain(X2, X1, r, W=w)
    return( 1 - c(obs,dum) / (pi*r^2) )
    }
  
  # Plot points and discs (radius r)
  plot.area = function(p, r) {
    p$marks = rep(2*r, p$n)          # Mark is rescaled to the circle diameter (not radius), (see ?plot.ppp)
    plot(p, 
         markscale=1, 
         legend=FALSE, 
         bty="n", 
         main="", 
         show.window=FALSE,
         cols='maroon')
    points(p, pch=20)
  }
  

range(x)   # 1  95
range(y)   # 2  99
w = owin(c(0,96), c(0,99))  # Window
r = R                       # Radius of disc around each point

X1 = ppp(x, y, window=w)    # "ppp" object: 71 observed points
Q = quadscheme(X1)          # "quad" object: 71 data points and 1028 dummies (grid of 32*32 + 4 corner points)
X2 = Q$dummy                # "ppp" object: 1028 dummy points

plot.area(p=X1, r=R)        # Plot

# Weights
Wt = Q$w

# Model response
U = as.ppp(Q)               # "ppp" object:  1099 points, (71 observed, 1028 dummy)
Y = numeric(U$n)
Y[is.data(Q)] = 1/Wt[is.data(Q)]

# Subset
rbord = 2*r    # Shortest distance between points that don't interact, (2r for AreaInter model).
sQ = rep.int(TRUE, U$n)
sQ = sQ & (bdist.points(U) >= rbord)

# Interaction
V = intra.group(X1, X2, r=R, w)    # 1099  (71 + 32*32+4)

# Fit
fmla = as.formula("Y ~ 1+V")                        # Formula for glm
glmdata = data.frame(Y, V)                          # Data for glm
fmly = quasi(link="log", variance="mu")             # Family and link for glm
ctrl = list(epsilon=1e-08, maxit=25, trace=FALSE)   # Control parameters for glm
fit = glm(fmla, data=glmdata, subset=sQ, weights=Wt, family=fmly, control=ctrl)

intercept <- coef(fit)[1]
intercept <- round(as.numeric(intercept),2)
inter <- coef(fit)[2]
inter <- round(as.numeric(inter),2)
outputList <- list(intercept, inter)

return(outputList)
}

#################################################################################################################
# # Compare with spatstat "AreaInter" model
# fit = ppm(X1, trend=~1, interaction=AreaInter(r))
# coef(fit)
