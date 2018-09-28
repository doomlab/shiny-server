write_spice <- function(creators_df_final, access_df_final,
                        attributes_df_final, bib_df_final, file_name_write) {

  #fileName,name,contentUrl,fileFormat
  access_df_final <- access_df_final[ !names(access_df_final)=="fileName" ]

  distribution <- purrr::pmap(access_df_final,
    function(name = NULL, contentUrl = NULL, fileFormat = NULL){
    list(type = "DataDownload",
         name = name,
         contentUrl = contentUrl,
         fileFormat = fileFormat)
  })

  attributes_df_final <- attributes_df_final[ !names(attributes_df_final)=="fileName" ]
  attributes_df_final <- dplyr::rename(attributes_df_final, name = variableName)
  attributes_df_final <- dplyr::distinct(attributes_df_final)

  variableMeasured <-
    purrr::pmap(attributes_df_final,
                PropertyValue)

  authors <- purrr::pmap(creators_df_final, Person)


  Dataset <- list(
    type = "Dataset",
    name = bib_df_final$title,
    creator = authors,
    description = bib_df_final$description,
    datePublished = bib_df_final$datePublished,
    keywords = strsplit(bib_df_final$keywords, ", ")[[1]],
    funder = bib_df_final$funder,
    temporalCoverage = paste(bib_df_final$startDate, bib_df_final$endDate, sep="/"),
    license = bib_df_final$license,
    spatialCoverage = list(
      type = "Place",
      name = bib_df_final$geographicDescription),
    variableMeasured = variableMeasured,
    distribution = distribution)

  out <- c(setNames("http://schema.org", "@context"), Dataset)
  toJSON(out, pretty = T, auto_unbox = T)

}



