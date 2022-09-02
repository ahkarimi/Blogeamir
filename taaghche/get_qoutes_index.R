get_qoutes_index <- function(id) {
  size <- 1
  json_url <- paste0("https://quote.taaghche.com/v1/quotes?bookId=", id, "&lastId=00&size=", size)
  qoutes <- jsonlite::fromJSON(json_url, simplifyDataFrame = TRUE)
  size <- qoutes$count
  json_url <- paste0("https://quote.taaghche.com/v1/quotes?bookId=", id, "&lastId=00&size=", size)
  qoutes <- jsonlite::fromJSON(json_url, simplifyDataFrame = TRUE)
  all_qoutes_index <- qoutes$quotes$data$chapterIndex
  return(all_qoutes_index)
}