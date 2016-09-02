
## Matching dirty data against standard labels

gender <- c("M", "male ", "Female", "fem.","female")
codes <- c("male", "female")

# Try it with base::match ()

# return index in 'codes'
codes
gender
match(gender, codes)

# normalize (using magrittr here for %>%)
library(magrittr)
gender_norm <- gender %>% tolower() %>% trimws()
gender_norm
match(gender_norm, codes)

# allow for some slack between the data and the lookup table
# with approximate matching
stringdist::amatch(gender, codes, maxDist=3)

# now with normalized data
i <- stringdist::amatch(gender_norm, codes, maxDist=3L)
i
gender_clean <- codes[i]
data.frame(dirty = gender, clean = gender_clean)
