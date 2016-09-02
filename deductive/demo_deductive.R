
library(deductive)
library(validate)
data(retailers)
dat <- retailers[3:8]
head(dat)

v <- validator(turnover + other.rev==total.rev
               , turnover > 0
               , other.rev>0
               , total.rev>0)

d1 <- correct_typos(dat,v)
d2 <- impute_lr(dat,v)

# validate offers a handy function to compare cells
validate::cells(start = dat, typo=d1,imp=d2)

# ... and also to compare the effect on validations
validate::compare(v, start=dat,type=d1, imp=d2)

