extractIsolationSource <- function(x){
  x <- XML::xpathApply(x, "//attribute[@attribute_name='isolation_source']", xmlValue)
  x <- stringr::str_trim(unlist(x))
  if(length(x) == 0)
    x <- NA
  return(x)
}
extractGeoCoordinates <- function(x){
  x <- XML::xpathApply(x, "//attribute[@attribute_name='lat_lon']", xmlValue)
  x <- stringr::str_trim(unlist(x))
  if(length(x) == 0)
    x <- NA
  return(x)
}
extractCollectionDate <- function(x){
  x <- XML::xpathApply(x, "//attribute[@attribute_name='collection_date']", xmlValue)
  x <- stringr::str_trim(unlist(x))
  if(length(x) == 0)
    x <- NA
  return(x)
}
extractSampleName <- function(x){
  x <- XML::xpathApply(x, "//ids/id[@db_label='sampleName']", xmlValue)
  x <- stringr::str_trim(unlist(x))
  if(length(x) == 0)
    x <- NA
  return(x)
}
extractGeographicLocation <- function(x){
  x <- XML::xpathApply(x, "//attribute[@attribute_name='geo_loc_name']", xmlValue)
  x <- stringr::str_trim(unlist(x))
  if(length(x) == 0)
    x <- NA
  return(x)
}




