#' Get price history
#'
#' function retreives price data for specified coin on specified date
#'
#' @param coin character
#' @param POSIX_date POSIXct
#' @param localization logical
#'
#' @import RJSONIO
#' @import RCurl
#'
#' @return list
#' @export
#'
#' @examples
#' get_coin_history(coin = "bitcoin", POSIX_date = as.POSIXlt("2015-12-01"))
#'
get_coin_history <- function(coin, POSIX_date, localization=FALSE){

        api_call_pt1 <- paste("https://api.coingecko.com/api/v3/coins/",
                              coin, "/history?date=", sep = "")

        # Format date as UTC as this is the format used by CoinGekko
        request_date <- as.POSIXlt(POSIX_date, tz = "utc", format="%d/%m/%Y")

        # Format date to character vector accepted by API
        request_date <- format(request_date, format="%d-%m-%Y")

        # Add localisation call if TRUE
        if (localization == TRUE){
                request_date <- paste(request_date, "&localization=false", sep = "")
        }

        api_call <- paste(api_call_pt1, request_date, sep = "")

        json_dat <- RCurl::getURLContent(api_call)

        api_dat <- RJSONIO::fromJSON(json_dat)

        return(api_dat)
}
