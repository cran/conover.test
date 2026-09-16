# conovertestttable displays Conover-Iman test t values, taking:
#   groupvar: group variable
#   index: index value of the group variable
#   Tvalues: real valued T test statistics
#   colstart: integer indicating starting column
#   colstop: integer indicating stopping column
# Outputs: formatted T statistics table row message for conover.test()
# Date: May 27, 2026
# Author: Alexis Dinno
conovertestttable <- function(groupvar, index, Tvalues, colstart, colstop) {
  groupvalues  <- levels(factor(groupvar))

  # Row headers
  vallab  <- substr(groupvalues[index], 1, 8)
  pad     <- 8-nchar(vallab)
  rowhead <- paste0(tpad(n=pad), vallab)
  t_row_head <- paste0(rowhead, " \U2502")

  # Table t entries
  t_row_tail <- ""
  for (i in colstart:colstop) {
    t <- Tvalues[(((index-2)*(index-1))/2) + i]
    t_row_tail <- paste0(t_row_tail, "  ", tformat(t), sep="")
    }
  rlang::inform(message=paste0(t_row_head, t_row_tail, sep=""))
  }

  
