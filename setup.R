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



### DCA

library(devtools)
install_github("https://github.com/SamBuckberry/CoinGeckoR")
library(CoinGeckoR)
library(magrittr)

from <- as.POSIXlt("2020-08-11", tz = "UTC")
to <- as.POSIXlt("2021-08-7", tz = "UTC")

currency <- "usd"
id <- "bitcoin"

prices <- coins_chart_range(id="bitcoin", currency="usd", from=from, to=to)
prices <- prices$prices %>% do.call(rbind, .)
prices <- prices[ ,2]

df <- data.frame(dates=seq(from, to, by = "days"), price=prices)
df$sats_per_unit <- 100000000 / df$price

freq_days <- 7
buy_pc <- 0.15
flat_fee <- 1.95
pay_freq_days <- 14
pay_commitment <- 500
per_day_amount <- pay_commitment / pay_freq_days



freq_vector <- seq(from = 1, to = nrow(df), by = 7)

df_sub <- df[freq_vector, ]
df_sub$units_bought <- pay_commitment





plot(x = seq(from, to, by = "days"), y = as.numeric(unlist(prices)))

hist_from <- get_coin_history(coin = "bitcoin", date_POSIXlt = from)
hist_from[hist_from$currency == "usd", ]

hist_to <- get_coin_history(coin = "bitcoin", date_POSIXlt = to)
hist_to[hist_to$currency == "usd", ]

(prices[[1]][[1]][1]/1000) %>% as_datetime()
prices[length(prices)]


library(lubridate)





