# Data validation rules for the 'retailers' dataset.

staff >= 0

turnover >= 0
other.rev >= 0
total.rev >= 0
staff.costs >= 0
total.costs >= 0

# balances
profit == total.rev - total.costs
total.rev == turnover + other.rev

# nonlinear rules

# 60% profit is unreasonable in retail
profit/total.rev < 0.6

# nobody works for free
if ( staff > 0 ) staff.costs > 0

# compute a value and reuse it (note := operator)
logto := log10(abs(turnover)+1)
# tukey's whisker on a log-scale
logto < median(logto,na.rm=TRUE) + 1.5*IQR(logto,na.rm=TRUE)
















