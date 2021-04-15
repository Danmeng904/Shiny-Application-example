lroutput <- function(choosedata){
  
  y <- names(choosedata)[ncol(choosedata)]
  
  x <- names(choosedata)[1:(ncol(choosedata)-1)]
  X <- c(x)
  
  f <- as.formula(
    paste(y,paste(X,collapse = "+"),
          sep = "~")
  )
  
  lrmodel <- lm(f, data = choosedata)
  
  return(summary(lrmodel))
}

