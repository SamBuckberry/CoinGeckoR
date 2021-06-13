#' Ping CoinGecko API
#'
#' @return character.
#' @export
#'
#' @examples ping_gecko()
#'
ping_gecko <- function(){

        ping <- RCurl::getURLContent("https://api.coingecko.com/api/v3/ping")
        ping <- RJSONIO::fromJSON(ping)
        return(ping)
}
