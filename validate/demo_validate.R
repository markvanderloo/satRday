library(magrittr)
library(validate)
data(retailers)

head(retailers)

## A first glance ----
retailers %>% 
  check_that(other.rev > 0, profit < turnover) %>% 
  summary()

## Define rules for reuse ----

v <- validator(
  staff >= 0
  , turnover >= 0
  , other.rev >= 0
  , total.rev >= 0
  , turnover + other.rev == total.rev
  , if (staff > 0) staff.costs > 0
)

v
summary(v)
variables(v,as="list")

## getters and setters for rule metadata
created(v)
origin(v)
names(v)
description(v)

cf <- confront(retailers, v)
cf

summary(cf)

aggregate(cf, by="record") %>% head()

sort(cf, by="rule") %>% head()

barplot(cf, main="retailers")

values(cf)

# setting options
retailers %>% 
  confront(v, lin.eq.eps=1e-8) %>% 
  barplot()


retailers %>% 
  confront(v, na.value=FALSE) %>% 
  barplot()

## Reading from file ----
w <- validator(.file="validate/rules.R")
confront(retailers,w) %>% barplot()


## Rich metadata: yaml files ----

u <- validator(.file="validate/rules.yaml")
u
confront(retailers,u) %>%
  barplot()

description(u)




