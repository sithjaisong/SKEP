#' Fertilizer information table (dataframe)
#' @details 
#' x class SQL
#' @export 
#' x is mySQL data
#' @return 
#' dataframe
#' @examples 
#' getFertilizerData(db) # not run
#' @keywords
#' MySQL
#'

getFertilizerData <- function(x) {
        left_join(tbl(x, "general_info"), tbl(x, "fertil_organic"), by = c(id = "id_main")) %>% 
                left_join(tbl(x, "fertil_mineral"), by = c(id = "id_main")) %>% 
                collect()
        
}
