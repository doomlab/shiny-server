# Create data frames for editing ------------------------------------------
access_df <- data.frame(fileName = character(),
                        name = character(),
                        contentUrl = character(),
                        fileFormat = character(),
                        stringsAsFactors = F)

attributes_df <- data.frame(fileName = character(),
                            variableName = character(),
                            description = character(),
                            unitText = character(),
                            stringsAsFactors = F)

bib_df <- data.frame(title = character(),
                       description = character(),
                       datePublished = character(),
                       citation = character(),
                       keywords = character(),
                       license = character(),
                       funder = character(),
                       geographicDescription = character(),
                       startDate = character(),
                       endDate = character(),
                       stringsAsFactors = F)

creators_df <- data.frame(id = character(),
                          givenName = character(),
                          familyName = character(),
                          affiliation = character(),
                          email = character(),
                          stringsAsFactors = F)