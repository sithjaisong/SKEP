#' @title Get SYT SKEP field data
#'
#' @description This function queries the database for field data
#'
#' @param x is the MySQL database hosted on Amazon Web Services
#'
#' @details This function returns a database of field data
#'
#' @return Field information table (dataframe)
#'
#' @importFrom magrittr %>%
#' @export
getFielddata <- function(x){
        latitude <- longitude <- NULL

        temp <- dplyr::left_join(dplyr::tbl(x, "general_info"),
                                 dplyr::tbl(x, "crop_estab_met"),
                                 by = c("id" = "id_main")) %>%
                dplyr::left_join(dplyr::tbl(x, "landform"),
                                 by = c("id" = "id_main")) %>%
                dplyr::collect()

        temp %>% transform(date = as.Date(as.character(date)),
                           latitude = as.numeric(as.character(latitude)),
                           longitude = as.numeric(as.character(longitude)))
}
