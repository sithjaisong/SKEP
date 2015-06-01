######################################################################
#getYieldData: inquery Pesticidedata from SKEP database
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
#' Fertilizer information table (dataframe)
#'
#' @examples a value x
#' @keywords
#' MySQL
#'

getYieldData <- function(x){
        
        tbl(x,"general_info") %>% 
                left_join(tbl(x,"weight_harv"), by = c("id" = "id_main")) %>%
                collect()
}