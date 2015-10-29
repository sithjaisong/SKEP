######################################################################
# SKEP.key: login to the SKEP data base
######################################################################
#'
#' Assess to the data base
#'
#' @param 
#' username  MUST BE Character
#'
#' @param 
#' password MUST BE Character
#' @details
#' We access through the SKEP data base and sort out the data foolowing your param
#'
#' @export
#'
#' @return
#' Data frame with Farm information 
#'
#' @examples 
#' loginSKEP("sjaisong", "MovingProton793") # not run
#' @keywords
#' MySQL
#'

loginSKEP <- function(username, password) {
        # use sith jaisong account for test the database urUsername <-
        # 'sjaisong' urPassword <- 'MovingProton793'
        
        # access to the database and load tables
        if (class(username) != "character" & class(password) != "character") {
                stop("Please check your username or password, They must be character")
        } else {
                
                mydb <- src_mysql(user = username, password = password, dbname = "syngenta", 
                                  host = "crophealth.irri.org")
        }
        
}
