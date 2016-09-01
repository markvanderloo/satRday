
library(VIM)
library(validate)
data(retailers)
library(simputation)
library(magrittr)
## Investigate missing data patterns ----
# plot missing data patterns
a <- VIM::aggr(retailers[3:9], sortComb=TRUE, sortVar=TRUE, only.miss=TRUE)

#
VIM::pbox(retailers[3:9],las=2)

dat <- log10(abs(retailers[c(3,5)]))
VIM::marginplot(dat, las=1, pch=16)

# testing means
t.test(log(staff) ~ is.na(other.rev), data=retailers)

## Impute values using simputation

# Linear model to impute three variables:
d1 <- impute_lm(retailers,   turnover ~ staff)
validate::cells(retailers, d1)

# Use staff as predictor for multiple variables
d2 <- impute_lm(retailers, turnover + other.rev + total.rev ~ staff)
validate::cells(retailers, d2)

# Impute everything excepts staff as a function of staff
d3 <- impute_lm(retailers, . - staff ~ staff)
validate::cells(retailers, d3)
aggr(d3)

## Chain methods

d4 <- retailers %>% 
  impute_lm(.-staff ~ staff) %>% # linear model 
  impute_median(. ~ size)        # group median
aggr(d4)




## Some other methods

# copy value from proxy
d5 <- impute_proxy(retailers, total.rev ~ vat)
validate::cells(retailers,d5)

# CART model imputation
d6 <- impute_cart(retailers, total.rev ~ .)

# robust linear model with parametric residuals added
d7 <- impute_rlm(retailers, total.rev ~  staff, add_residual = "normal")


## variance of estimation, including imputation by bootstrap:
stat <- function(dat,i){
  dat <- dat[i,,drop=FALSE]
  dat %<>% impute_lm(staff.costs ~ staff + total.rev) %>% 
    impute_lm(staff.costs ~ staff) %>%
    impute_median(staff.costs ~ size) %>%
    impute_const(staff.costs ~ 0)
  mean(dat[,"staff.costs"],na.rm=TRUE)
}
stat(retailers,seq_len(nrow(retailers)))

library(boot)
b = boot(data=retailers, statistic = stat,R=100)
plot(b)


