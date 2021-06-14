CoinGeckoR
================

### R wrapper for the CoinGecko API

*Package is currently under development and in its infancy*

<https://www.coingecko.com/en/api>

### How to install CoinGeckoR

-----

GitHub

``` r
library(devtools)
install_github("https://github.com/SamBuckberry/CoinGeckoR")
```

Load the library

``` r
library(CoinGeckoR)
```

### Examples of CoinGeckoR functions

-----

#### Simple

-----

Ping the CoinGecko API `/simple/ping`

``` r
ping_gecko()
```

    ##          gecko_says 
    ## "(V3) To the Moon!"

`/simple/price` Get the current price of any cryptocurrencies in any
other supported currencies that you need.

`/simple/supported_vs_currencies` Get list of supported\_vs\_currencies

``` r
support_list <- supported_vs_currencies()
head(support_list)
```

    ## [1] "btc" "eth" "ltc" "bch" "bnb" "eos"

#### Coins

-----

List all supported coins id, name and symbol. `/coins/list`

Retreive coin price history for a specific date

``` r
btc_price_df <- get_coin_history(coin = "bitcoin",
                                   date_POSIXlt = as.POSIXlt("2015-12-31"))
head(btc_price_df)
```

    ##         date    coin symbol currency      price   market_cap total_volume
    ## 1 31-12-2015 bitcoin    btc      aed  1583.4679  23798453966   4811431259
    ## 2 31-12-2015 bitcoin    btc      ars  5590.2992  84018423113  16986349950
    ## 3 31-12-2015 bitcoin    btc      aud   592.5117   8905050906   1800370745
    ## 4 31-12-2015 bitcoin    btc      bdt 33848.6328 508722102886 102850438593
    ## 5 31-12-2015 bitcoin    btc      bhd   162.5424   2442902871    493891715
    ## 6 31-12-2015 bitcoin    btc      bmd   431.1390   6479728151   1310033275
