### A systematic approach to datacleaning with R

This repo is has some data, scripts and other materials supporting the tutorial given
at the [satRday](http://budapest.satrdays.org/) conference in Budapest, 3 September 2016.

#### Presentation

Available on [slideshare](http://www.slideshare.net/MarkVanDerLoo/sat-rday)

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




