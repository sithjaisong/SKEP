######################################################################
#getYieldData: query yield data from SYT SKEP database
######################################################################
#'
#' Get yield data
#' @param x is mySQL data
#'
#' @details x
#'
#'
#' @export
#'
#' @return
#' Farm infomation and yields information table (dataframe)
#'
#' @examples a value x
#' @keywords
#' MySQL
#'

getYieldData <- function(x){
             tbl(x, "general_info") %>%
                left_join(tbl(x, "weight_harv"), by = c("id" = "main_id")) %>%
                collect()
}
