######################################################################
# SKEP.key: login to the SKEP data base
######################################################################
#'
#' Provide login credentials for SYT SKEP database
#'
#' @param username MUST BE Character
#'
#' @param password MUST BE Character
#' @details
#' We access through the SKEP data base and sort out the data foolowing your param
#'
#' @export
#'
#' @return
#' Data frame with Farm information
#'
#' @examples loginSKEP("sjaisong", "userpass") # not run
#' @keywords
#' MySQL
#'

loginSKEP <- function(username, password){
        # use sith jaisong account for test the database
        #urUsername <- "sjaisong"
        # urPassword <- "userpass"

        # access to the database and load tables
        if (class(username) != "character" & class(password) != "character") {
                stop("Please check your username or password, they must be characters.")
        }else{

                mydb <- src_mysql(user = username,
                                  password = password,
                                  dbname = "syngenta",
                                  host = "crophealth.irri.org"
                )
        }
}
