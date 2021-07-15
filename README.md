CoinGeckoR
================

<a><img src="images/CoinGecko_Logo.png" align="left" height="100" width="100" ></a>

### R functions for interacting with the CoinGecko API

**Powered by** [CoinGecko](https://www.coingecko.com/). *Currently under
development*

CoinGecko API documentation (v3)
<https://www.coingecko.com/api/documentations/v3>

-----

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

-----

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

-----

#### Simple

  - `/simple/price`  
    Get the current price of any cryptocurrencies in any other supported
    currencies that you need.

<!-- end list -->

``` r
price(ids = "bitcoin", vs_currencies = "aud")
```

    ## $bitcoin
    ##   aud 
    ## 44301

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

-----

#### Coins

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
    ## [1] 33099

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

  - `/coins/{id}/tickers` Get coin tickers (paginated to 100 items).
    This function returns a lot of information\!

<!-- end list -->

``` r
ticker_dat <- coins_tickers(id="bitcoin")
```

-----

#### Categories

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
    ## [6,] "polygon-ecosystem"              "Polygon Ecosystem"               
    ##      market_cap   market_cap_change_24h volume_24h  updated_at                
    ## [1,] 113601514538 0.5849826             50099196049 "2021-07-15T00:55:26.563Z"
    ## [2,] 85569102370  -0.07798799           7962451040  "2021-07-15T00:55:25.732Z"
    ## [3,] 73746653406  0.2622094             5932621908  "2021-07-15T00:55:23.349Z"
    ## [4,] 67226653938  0.2066221             6071975531  "2021-07-15T00:55:20.323Z"
    ## [5,] 63892494423  0.00730046            3114847738  "2021-07-15T00:55:03.952Z"
    ## [6,] 30527030359  -0.06531533           4996673699  "2021-07-15T00:55:16.428Z"

-----

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
