###################################################################### getWeedData: inquery Pesticidedata from SKEP database
#'
#' Get weed infestation data
#'
#' @param x is mySQL data
#'
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

getWeedData <- function(x) {
        
        weed.rank <- tbl(x, "weed_rank") %>% collect() %>% select(-id_weed_rank, 
                                                                  -main_weed) %>% transform(weed_type = as.factor(weed_type))
        
        # save the list of weed type
        weed.type <- collect(tbl(x, "weed_type"))$weed_type
        
        # rename weed type codes to weed type names
        levels(weed.rank$weed_type) <- weed.type
        
        # make data more tidy
        weed.rank.df <- spread(weed.rank, weed_type, data)
        # ================================================
        weed.main <- tbl(x, "weed_main") %>% select(-id_weed_main) %>% collect() %>% 
                transform(area = as.factor(area))
        
        # rename sampling area from A, B, C to 1, 2, 3
        levels(weed.main$area) <- c("1", "2", "3")
        # save to data frame of weed species lists
        weed.list <- collect(tbl(x, "weed_list"))
        
        # combine the main weed spcies with weed main species codes
        all.weed <- left_join(weed.main, weed.list, by = "weed_list_id")
        
        # combine weed ranking with main weed species
        left_join(weed.rank.df, all.weed, by = c("id_ci", "area"))
        
}






