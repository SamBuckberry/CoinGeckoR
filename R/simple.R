
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
