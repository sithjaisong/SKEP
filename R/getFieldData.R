#' getFertilizerdata: inquery fertilizer data from SKEP database
#'
#' @param 
#' x is mySQL data
#' @return 
#' Field information table (dataframe)
#' @examples 
#' getFielddata(db) # not run
#' @keywords 
#' MySQL
#'

getFielddata <- function(x) {
        
        temp <- left_join(tbl(x, "general_info"), tbl(x, "crop_estab_met"), 
                          by = c(id = "id_main")) %>% left_join(tbl(x, "landform"), by = c(id = "id_main")) %>% 
                collect()
        
        temp %>% transform(date = as.Date(as.character(date)), latitude = as.numeric(as.character(latitude)), 
                           longitude = as.numeric(as.character(longitude)))
        
        
}