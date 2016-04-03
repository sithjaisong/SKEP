######################################################################
#getWeedData: query weed data from SYT SYT SKEP database
######################################################################
#'
#' Get weed infestation data
#'
#' @param x is mySQL data
#'
#' @details x
#'
#'
#' @export
#'
#' @return
#' Fertilizer information table (dataframe)
#'
#' @examples a value x
#' @keywords
#' MySQL
#'

getWeedratingData <- function(x){

        weed_rating <-tbl(x,"weed_rating") %>%
                collect() %>%
                select(-id_weed_rating)

}
