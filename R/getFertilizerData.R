######################################################################
#getFertilizerdata: inquery Filed data from SKEP database
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

getFertilizerData <- function(x){
        left_join(tbl(x,"general_info"), tbl(x,"fertil_organic"), by = c("id" = "id_main")) %>%
                left_join(tbl(x,"fertil_mineral"), by = c("id" = "id_main")) %>%
                collect()

        }

