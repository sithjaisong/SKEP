######################################################################
# SKEP.key: login to the SKEP data base
######################################################################
#'
#' Assess to the data base
#'
#' @param username  MUST BE Character
#'
#' @param password MUST BE Character
#' @details
#' We access through the SKEP data base and sort out the data foolowing your param
#'
#' @export
#'
#' @return
#' If two vectors, \code{x} and \code{y}, are provided, the output is a
#'   matrix with two columns, with the quantile normalized versions of
#'   \code{x} and \code{y}.
#'   If \code{y} is missing, \code{x} should be a matrix, in which case the
#'   output is a matrix of the same dimensions with the columns quantile
#'   normalized with respect to each other.
#'
#' @examples a value x
#' @keywords
#' MySQL
#'

loginSKEP <- function(username, password){
        # use sith jaisong account for test the database
       #urUsername <- "sjaisong"
        # urPassword <- "MovingProton793"
        
        # access to the database and load tables 
        mydb<- src_mysql(user = username,  
                         password = password, 
                         dbname = "syngenta",
                         host = "crophealth.irri.org"
        ) 
}



