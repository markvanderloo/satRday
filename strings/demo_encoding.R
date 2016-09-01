# Also specify fileEncoding="UTF-8" if you are not on a unix-like OS.
# This will set the right labels.

## reading ----
bands <- read.csv2("strings/bands_utf8.csv",stringsAsFactors = FALSE)
bands

## Effect of setting encoding labels ----
b <- bands$band
Encoding(b) <- "latin1"
b
Encoding(b) <- "UTF-8"
b

## re-encode to latin1 ----
iconv(b, from="UTF-8", to="ASCII")

stringi::stri_encode(b,from="UTF-8",to="ASCII")


## Transliteration ----
iconv(b, from ="UTF-8", to="ASCII//TRANSLIT")

## or, with stringi 
stri_trans_general(b, "latin-ascii")

## Unicode normalization ----
str <- read.csv2("strings/motorheads.csv",stringsAsFactors=FALSE)$band
str
str[1] == str[2]

str2 <- stri_trans_nfkc(str)
str2
str2[1] == str2[2]
