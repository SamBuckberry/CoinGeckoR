CoinGeckoR
================

## R wrapper for the CoinGecko API

### How to install CoinGeckoR

GitHub

``` r
library(devtools)
install_github("https://github.com/SamBuckberry/CoinGeckoR")
```

CRAN

``` r
install.packages("CoinGeckoR")
```

### Examples of CoinGeckoR functions

``` r
library(CoinGeckoR)
```

Retreive coin price history for a specific date

``` r
btc_price_list <- get_coin_history(coin = "bitcoin",
                                   date_POSIXlt = as.POSIXlt("2015-12-31"))
head(btc_price_list)
```

    ##         date    coin symbol currency      price   market_cap total_volume
    ## 1 31-12-2015 bitcoin    btc      aed  1583.4679  23798453966   4811431259
    ## 2 31-12-2015 bitcoin    btc      ars  5590.2992  84018423113  16986349950
    ## 3 31-12-2015 bitcoin    btc      aud   592.5117   8905050906   1800370745
    ## 4 31-12-2015 bitcoin    btc      bdt 33848.6328 508722102886 102850438593
    ## 5 31-12-2015 bitcoin    btc      bhd   162.5424   2442902871    493891715
    ## 6 31-12-2015 bitcoin    btc      bmd   431.1390   6479728151   1310033275
