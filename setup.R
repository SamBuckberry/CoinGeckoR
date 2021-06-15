library(devtools)
library(usethis)
library(assertthat)

usethis::use_package("RJSONIO")
usethis::use_package("RCurl")
usethis::use_package("assertthat")

load_all()

document()
check()
install()



