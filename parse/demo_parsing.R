source("trim/parse_outfile.R")

to <- read_tof("trim/skylark-1d.out")
to

get_n_site(to)

get_n_site_stringr(to)

get_time_indices(to)



# tip: test/exercise regular expressions (stringr >= 1.1.0)
library(stringr)
str_view("<em>hello</em> world","<em>.*?</em>")
