

# Read a TRIM3 output file into a single string. ----
read_tof <- function(file){
  r <- readLines(file)
  r <- paste(r,collapse="\n")
  # add class attribute for nice printing
  class(r) <- c("tof","character")
  r
}

# use 'cat' rather than print so \n is interpreted.
print.tof <- function(x,...){
  cat(x)
}


## extract number of sites using base R ----
get_n_site <- function(x){
  # 1. localize the block of text containing nr of sites
  mm <- regexpr("Site[[:blank:]]{5,}.*?\n",x)
  # 2. extract the block
  s <- regmatches(x,mm)
  # 3. extract information from the block.
  get_num(s)
}

get_num <- function(x){
  mm <- regexpr("[0-9]+\\.?[0-9]*",x)
  as.numeric(regmatches(x,mm))
}


## extract number of sites using stringr ----
library(stringr)
get_n_site_stringr <- function(x){
  # 1. and 2. localize block and extract.
  s <- str_extract(x, "Site[[:blank:]]{5,}.*?\n")
  # 3. extract number
  get_num(s)
}


## extract a table using base R ----
get_time_indices <- function(x){
  re <- "TIME INDICES.*?\n[[:blank:]]*\n"
  # 1. localize the block containing the table
  mm <- regexpr(re, x, ignore.case=TRUE)
  # 2. Extract the block
  s <- regmatches(x, mm)
  
  # 3. extract information:
  # 3.1 remove double line endings
  s <- gsub("\n\n","\n",s)
  # 3.2 remove title line
  re2 <- paste0("TIME INDICES",".*?\n+")
  s <- gsub(re2,"",s,ignore.case=TRUE)
  
  # 3.3 now we have a fixed-width table, readable with std. functions
  read.table(text=s, header=TRUE, strip.white=TRUE
   , fill=TRUE, colClasses=c("integer",rep("numeric",4)))
}

