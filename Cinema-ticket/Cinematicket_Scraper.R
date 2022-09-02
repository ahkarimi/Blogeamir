library(httr)
library(rvest)
library(magrittr)


GetTable <- function(html) {
  # Extract the boxoffice data (first table in HTML page),
  # And convert it to a table
  
  weekly.boxoffice  <- html %>%
    html_nodes("table") %>%
    extract2(1) %>%
    html_table()
  
}


GetBoxOffice <- function() {
  # The main function we need to scrape boxoffice table of Cinematicket website
  
  # Address of the boxoffice table
  url <- "https://cinematicket.org/?p=boxoffice"
  
  # Send a request to website to get that page
  response <- GET(url = url)
  
  # Get the HTML of response
  html <- read_html(response)
  
  # Call the function to extract table and return it
  return(GetTable(html))
  
}


boxoffice.table <- GetBoxOffice()

boxoffice.table


# Write the table in a file in working directory
write.table(boxoffice.table, file = "boxoffice.csv", col.names = TRUE, row.names=FALSE)
