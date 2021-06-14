
#' Ping CoinGecko API
#' This function is run with no arguments.
#'
#' @return character.
#' @export
#'
#' @examples ping_gecko()
#'
ping_gecko <- function(){

        v <- api_version()
        api_call <- paste0(v, "ping")
        json_dat <- get_json(api_call)
        return(json_dat)

}


#' Title
#'
#' @param ids id of coins. refers to `coins/list`. character
#' @param vs_currencies vs_currency of coins. refers to simple/supported_vs_currencies. character
#' @param include_market_cap logical.
#' @param include_24hr_vol logical.
#' @param include_24hr_change logical.
#' @param include_last_updated_at logical.
#'
#' @return list.
#' @export
#'
#' @examples price(ids=c("bitcoin","ethereum"), vs_currencies=c("usd","aud"))
price <- function(ids, vs_currencies,
                  include_market_cap=FALSE,
                  include_24hr_vol=FALSE,
                  include_24hr_change=FALSE,
                  include_last_updated_at=FALSE){

        # Checks
        assertthat::assert_that(class(ids) == "character")
        assertthat::assert_that(class(vs_currencies) == "character")
        assertthat::assert_that(class(include_market_cap) == "logical")
        assertthat::assert_that(class(include_24hr_vol) == "logical")
        assertthat::assert_that(class(include_24hr_change) == "logical")
        assertthat::assert_that(class(include_last_updated_at) == "logical")

        v <- api_version()

        # Construct the API call from arguments

        ids <- paste(ids, collapse = "%2C")
        vs_currencies <- paste(vs_currencies, collapse = "%2C")

        api_call <- paste0(v, "simple/price?ids=", ids,
        "&vs_currencies=", vs_currencies,
        "&include_market_cap=", casefold(include_market_cap),
        "&include_24hr_vol=", casefold(include_24hr_vol),
        "&include_24hr_change=", casefold(include_24hr_change),
        "&include_last_updated_at=", casefold(include_last_updated_at))

        json_dat <- get_json(api_call)
        return(json_dat)

}

#' Get list of supported_vs_currencies.
#' This function is run with no arguments.
#'
#' @return character. List of currency symbols.
#' @export
#'
#' @examples supported_vs_currencies()
supported_vs_currencies <- function(){

        v <- api_version()
        api_call <- paste0(v, "simple/supported_vs_currencies")
        json_dat <- get_json(api_call)
        return(json_dat)

}
