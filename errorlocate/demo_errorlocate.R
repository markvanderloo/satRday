

library(validate)
data(retailers)
library(errorlocate)

v <- validator(.file="validate/rules.yaml")

dat <- retailers[variables(v)]

# workaround for issue #8 on data-cleaning/errorlocate
dat[is.na(dat)] <- 0

el <- locate_errors(dat, v)

head(values(el))

# set variables that are deemed wrong to missing:
dat[values(el)] <- NA

# now we have a set that can be imputed, while satisfying all rules in v
