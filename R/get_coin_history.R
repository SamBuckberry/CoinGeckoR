#' Get price history
#'
#' function retreives price data for specified coin on specified date
#'
#' @param coin character
#' @param date_POSIXlt POSIXlt
#' @param simplify logical
#' @param localization logical
#'
#' @import RJSONIO
#' @import RCurl
#' @import assertthat
#'
#' @return list
#' @export
#'
#' @examples
#' get_coin_history(coin = "bitcoin", date_POSIXlt = as.POSIXlt("2015-12-01"))
#'
get_coin_history <- function(coin, date_POSIXlt, simplify=TRUE, localization=FALSE){

        # Check date is in correct format
        assertthat::assert_that(class(date_POSIXlt)[1] == "POSIXlt",
                                msg = "POSIXlt_date is not of class POSIXlt")

        # Check that coin is in list
        # assertthat::

        # Check classes
        assertthat::assert_that(class(simplify) == "logical")
        assertthat::assert_that(class(localization) == "logical")

        api_call_pt1 <- paste("https://api.coingecko.com/api/v3/coins/",
                              coin, "/history?date=", sep = "")

        # Format date as UTC as this is the format used by CoinGekko
        request_date <- as.POSIXlt(date_POSIXlt, tz = "utc", format="%d/%m/%Y")

        # Format date to character vector accepted by API
        request_date <- format(request_date, format="%d-%m-%Y")

        # Add localisation call if TRUE
        if (localization == TRUE){
                request_date <- paste(request_date, "&localization=false", sep = "")
        }

        api_call <- paste(api_call_pt1, request_date, sep = "")

        json_dat <- RCurl::getURLContent(api_call)

        api_dat <- RJSONIO::fromJSON(json_dat)

        if (simplify == TRUE){
                api_dat <- data.frame(date=request_date,
                                      coin=api_dat$id,
                                      symbol=api_dat$symbol,
                                      currency=names(api_dat$market_data$current_price),
                                      price=api_dat$market_data$current_price,
                                      market_cap=api_dat$market_data$market_cap,
                                      total_volume=api_dat$market_data$total_volume)
                rownames(api_dat) <- NULL
        }

        return(api_dat)
}
