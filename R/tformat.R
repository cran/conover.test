# tformat: formats t values for display in table, taking
#   t: a real t-value
# Returns: a formatted string
# Date: September 15, 2026
# Author: Alexis Dinno
tformat <- function(t) {
  if (t < 0) {
    sign_t <- "-"
    }
   else {
     sign_t <- " "
     }
  if (abs(t) >= 1) {
    leftspaces <- max(2, floor(log10(abs(t)))+2)
    leftdigits <- floor(abs(t))
    rightspaces <- 8 - leftspaces
    rightdigits <- substr(paste0(abs(t) - floor(abs(t)), "00000000"), 3, rightspaces+2)
    return(paste0(sign_t, leftdigits, ".", rightdigits))
    }
  if (abs(t) <= 1) {
    if (t < 0) {
      return(sprintf("%0.6f", t))
      }
    if (t >= 0) {
      return(paste0(" ", sprintf("%0.6f", t)))
      }
    }
  }