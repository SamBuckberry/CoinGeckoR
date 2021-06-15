CoinGeckoR
================

### R functions for interacting with the CoinGecko API

*Package is currently under development and in its infancy*

CoinGecko API documentation <https://www.coingecko.com/en/api>

### Installation

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

### CoinGeckoR functions

-----

#### Ping

  - `/simple/ping`  
    Check API server status

<!-- end list -->

``` r
ping_gecko()
```

    ##          gecko_says 
    ## "(V3) To the Moon!"

#### Simple

-----

  - `/simple/price`  
    Get the current price of any cryptocurrencies in any other supported
    currencies that you need.

<!-- end list -->

``` r
price(ids = "bitcoin", vs_currencies = "aud")
```

    ## $bitcoin
    ##   aud 
    ## 52472

  - `/simple/token_price/{id}`  
    Get current price of tokens (using contract addresses) for a given
    platform in any other currency that you need.

  - `/simple/supported_vs_currencies`  
    Get list of supported\_vs\_currencies

<!-- end list -->

``` r
support_list <- supported_vs_currencies()
support_list[1:6]
```

    ## [1] "btc" "eth" "ltc" "bch" "bnb" "eos"

#### Coins

-----

  - `/coins/list` List all supported coins id, name and symbol.

<!-- end list -->

``` r
cl <- coins_list()

# Make as a data.frame
cl <- do.call(rbind, cl)
cl[1:3, ]
```

    ##      id                              symbol     name                           
    ## [1,] "01coin"                        "zoc"      "01coin"                       
    ## [2,] "0-5x-long-algorand-token"      "algohalf" "0.5X Long Algorand Token"     
    ## [3,] "0-5x-long-altcoin-index-token" "althalf"  "0.5X Long Altcoin Index Token"

  - `/coins/markets` List all supported coins price, market cap, volume,
    and market related data.

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
