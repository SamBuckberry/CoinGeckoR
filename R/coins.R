
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



