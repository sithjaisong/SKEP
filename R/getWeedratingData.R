#' @title Get SYT SKEP weed rating data
#'
#'@description This function queries the database for weed rating data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of weed injury rating data
#'
#' @return Weed injury information table (dataframe)
#'
#' @importFrom magrittr %>%
#' @export
getWeedratingData <- function(x){
        weed_rating <- dplyr::tbl(x, "weed_rating") %>%
                dplyr::collect() %>%
                dplyr::select(-id_weed_rating)

}
