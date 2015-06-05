######################################################################
#getfileddata: inquery Filed data from SKEP database
######################################################################
#'
#' Get field iinformation
#'
#' @param x is mySQL data
#'
#' @details x
#' 
#'
#' @export x
#'
#' @return
#' Field information table (dataframe)
#'
#' @examples a value x
#' @keywords
#' MySQL
#'

getFielddata <- function(x){
        
        left_join(tbl(x,"general_info"), tbl(x,"crop_estab_met"), by = c("id" = "id_main")) %>%
                left_join(tbl(x,"landform"), by = c("id" = "id_main")) 
        
}