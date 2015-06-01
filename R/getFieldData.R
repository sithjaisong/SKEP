######################################################################
#getfileddata: inquery Filed data from SKEP database
######################################################################
#'
#' Assess to the data base
#'
#' @param x is mySQL data
#'
#' @param country is code
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

getfielddata <- function(x){
        
        left_join(tbl(x,"general_info"), tbl(x,"crop_estab_met"), by = c("id" = "id_main")) %>%
                left_join(tbl(x,"landform"), by = c("id" = "id_main"))
        
}