
## reading with read.table ----
dat <- read.table(
  file = "table/unnamed.csv"
  , header = FALSE
  , col.names = c("age","height")
  , stringsAsFactors=FALSE
  , sep=",")


## define colClasses ----
dat <- read.table(
  file = "table/unnamed.csv"
  , header = FALSE
  , col.names = c("age","height")
  , colClasses = c("numeric","numeric")
  , stringsAsFactors=FALSE
  , sep=",")


## reading with the readr package ----

# parse columns as 'number' (flexible)
readr::read_csv("table/unnamed.csv"
      , col_names=c("age","height")
      , col_types="nn")

# parse columns as 'double' (strict)
readr::read_csv("table/unnamed.csv"
      , col_names=c("age","height")
      , col_types="dd")

