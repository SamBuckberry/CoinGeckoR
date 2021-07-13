
#' Coins list
#' @description List all supported coins id, name and symbol.
#' @param include_platform logical.
#'
#' @return list.
#' @export
#'
#' @examples coins_list()
coins_list <- function(include_platform=FALSE){

        v <- api_version()
        api_call <- paste0(v, "coins/list?include_platform=",
                           casefold(include_platform))
        json_dat <- get_json(api_call)
        return(json_dat)

}

#' Markets
#' @description Use this to obtain all the coins market data (price, market cap, volume)
#'
#' @param vs_currency Character. The target currency of market data (usd, eur, jpy, etc).
#' @param ids Character. The ids of the coin, comma separated crytocurrency symbols (base). refers to /coins/list.
#' @param category Character. filter by coin category. Refer to /coin/categories/list. Default=NA.
#' @param order Character. valid values: market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc
#' @param per_page Integer. valid values: 1…250. Total results per page
#' @param page Integer. Page through results
#' @param sparkline Logical. Include sparkline 7 days data (eg. true, false)
#' @param price_change_percentage Include price change percentage in 1h, 24h, 7d, 14d, 30d, 200d, 1y (eg. '1h,24h,7d' comma-separated, invalid values will be discarded)
#'
#' @return list.
#' @export
#'
#' @examples markets(vs_currency="usd", ids="bitcoin")
markets <- function(vs_currency, ids, category=NA,
                    order="market_cap_desc", per_page=10,
                    page=1, sparkline=FALSE, price_change_percentage="24h"){

        v <- api_version()

        api_call <- paste0(v,
                           "coins/markets?vs_currency=", paste(casefold(vs_currency), collapse = ","),
                           "&ids=", paste(casefold(ids),collapse = ","),
                           "&order=", order,
                           "&per_page=", per_page,
                           "&page=", page,
                           "&sparkline=", casefold(sparkline),
                           "&price_change_percentage=", price_change_percentage)
        if (!is.na(category) & class(category) == "charater"){
                paste0(api_call, "&category=", category)
        }

        json_dat <- get_json(api_call)
        return(json_dat)
}


#' Coin data
#'
#' @param id Character. The id of the coin. refers to /coins/list.
#' @param localization logical.
#' @param tickers logical.
#' @param market_data logical.
#' @param community_data logical.
#' @param developer_data logical.
#' @param sparkline logical.
#'
#' @return list.
#' @export
#'
#' @examples coins_data()
#'
coins_data <- function(id="bitcoin", localization=FALSE,
                       tickers=FALSE, market_data=TRUE,
                       community_data=FALSE, developer_data=FALSE,
                       sparkline=FALSE){

        assertthat::assert_that(class(id) == "character")
        assertthat::assert_that(class(localization) == "logical")
        assertthat::assert_that(class(tickers) == "logical")
        assertthat::assert_that(class(market_data) == "logical")
        assertthat::assert_that(class(community_data) == "logical")
        assertthat::assert_that(class(developer_data) == "logical")
        assertthat::assert_that(class(sparkline) == "logical")

        v <- api_version()

        api_call <- paste0(v,
                           "coins/", id,
                           "?localization=", casefold(localization),
                           "&tickers=", casefold(tickers),
                           "&market_data=", casefold(market_data),
                           "&community_data=", casefold(community_data),
                           "&developer_data=", casefold(developer_data),
                           "&sparkline=", casefold(sparkline))

        json_dat <- get_json(api_call)
        return(json_dat)

}


#' Coin tickers
#'
#' @param id Character. The id of the coin. refers to /coins/list.
#'
#' @return list.
#' @export
#'
#' @examples coins_tickers(id="bitcoin")
coins_tickers <- function(id){

        assertthat::assert_that(class(id) == "character")

        v <- api_version()

        api_call <- paste0(v,"coins/", id, "/tickers")

        json_dat <- get_json(api_call)
        return(json_dat)
}


