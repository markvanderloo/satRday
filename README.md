### A systematic approach to datacleaning with R

This repo is has some data, scripts and other materials supporting the tutorial given
at the [satRdays]() conference in Budapest, 3 September 2016.

#### Presentation

<iframe src="http://www.slideshare.net/MarkVanDerLoo/slideshelf" width="615px" height="470px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:none;" allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>

#### Packages used

To run the scripts, install the packages with the script below (you need
[Rtools](https://cran.r-project.org/bin/windows/Rtools/) if you're not on a Unix-like OS).

```r
## CRAN packages:
install.packages(c("deductive","drat","stringdist","stringr","validate","VIM"))
## pkgs not on CRAN yet:
drat::addRepo("markvanderloo")
install.packages("simputation")
drat::addRepo("data-cleaning") 
install.packages("errorlocate")
```




