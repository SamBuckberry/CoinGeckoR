CoinGeckoR
================

### R functions for interacting with the CoinGecko API

*Package is currently under development and in its infancy*

CoinGecko API documentation (v3)
<https://www.coingecko.com/api/documentations/v3>

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
    ## 44520

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

<!-- end list -->

``` r
mkt <- markets(vs_currency = "usd", ids = "bitcoin")

mkt[[1]][c("id", "current_price")]
```

    ## $id
    ## [1] "bitcoin"
    ## 
    ## $current_price
    ## [1] 33717

  - `/coins/{id}` Get current data (name, price, market, … including
    exchange tickers) for a coin.

<!-- end list -->

``` r
cd <- coins_data(id = "bitcoin")

# See data types in the list
names(cd)
```

    ##  [1] "id"                              "symbol"                         
    ##  [3] "name"                            "asset_platform_id"              
    ##  [5] "platforms"                       "block_time_in_minutes"          
    ##  [7] "hashing_algorithm"               "categories"                     
    ##  [9] "public_notice"                   "additional_notices"             
    ## [11] "description"                     "links"                          
    ## [13] "image"                           "country_origin"                 
    ## [15] "genesis_date"                    "sentiment_votes_up_percentage"  
    ## [17] "sentiment_votes_down_percentage" "market_cap_rank"                
    ## [19] "coingecko_rank"                  "coingecko_score"                
    ## [21] "developer_score"                 "community_score"                
    ## [23] "liquidity_score"                 "public_interest_score"          
    ## [25] "market_data"                     "public_interest_stats"          
    ## [27] "status_updates"                  "last_updated"

#### Categories

-----

  - `/coins/categories/list` List all categories

<!-- end list -->

``` r
cat_list <- coin_categories()

cat_list <- do.call(rbind, cat_list)
head(cat_list)
```

    ##      category_id               name                     
    ## [1,] "recently_added"          "Recently Added"         
    ## [2,] "aave-tokens"             "Aave Tokens"            
    ## [3,] "analytics"               "Analytics"              
    ## [4,] "artificial-intelligence" "Artificial Intelligence"
    ## [5,] "asset-backed-tokens"     "Asset-backed Tokens"    
    ## [6,] "asset-manager"           "Asset Manager"

  - `/coins/categories/list` List all categories with market data

<!-- end list -->

``` r
cat_list <- coin_categories_data()

cat_list <- do.call(rbind, cat_list)
head(cat_list)
```

    ##      id                               name                              
    ## [1,] "stablecoins"                    "Stablecoins"                     
    ## [2,] "exchange-based-tokens"          "Exchange-based Tokens"           
    ## [3,] "decentralized-finance-defi"     "Decentralized Finance (DeFi)"    
    ## [4,] "binance-smart-chain"            "Binance Smart Chain Ecosystem"   
    ## [5,] "centralized-exchange-token-cex" "Centralized Exchange Token (CEX)"
    ## [6,] "meme-token"                     "Meme Tokens"                     
    ##      market_cap   market_cap_change_24h volume_24h  updated_at                
    ## [1,] 111330579836 1.952634              87305358497 "2021-06-23T23:55:23.765Z"
    ## [2,] 79878070233  12.76361              9151934579  "2021-06-23T23:55:22.998Z"
    ## [3,] 65090655816  9.575776              6778123385  "2021-06-23T23:55:19.964Z"
    ## [4,] 63607767727  12.46071              11059353508 "2021-06-23T23:55:17.621Z"
    ## [5,] 59657860996  12.59784              4905625182  "2021-06-23T23:55:04.397Z"
    ## [6,] 34554934483  24.24541              6450245040  "2021-06-23T23:55:14.572Z"

#### Examples

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
